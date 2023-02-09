# Define the provider
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

# Define the provider options
provider "google" {
  project = "project-gcp-srp-hw"
  region = "us-central1"
  zone = "us-central1-c"
  credentials = "project-gcp-srp-hw-085eccd0cd34.json"
}

# Define the bucket
resource "google_storage_bucket" "bucket" {
  name = "bucket-gcp-srp-hw-1"
  location = "us-central1"
}

# Archive the function files
data "archive_file" "source" {
  type = "zip"
  source_dir = "function"
  output_path = "function.zip"
}

# Define the bucket content
resource "google_storage_bucket_object" "archive" {
  name = "source.zip"
  content_type = "application/zip"
  bucket = google_storage_bucket.bucket.name
  source = data.archive_file.source.output_path

  depends_on = [
    google_storage_bucket.bucket,
    data.archive_file.source]
}

# Define the cloud function
resource "google_cloudfunctions_function" "function" {
  name = "function-gcp-srp-hw"
  description = "Function for HW 1"
  runtime = "python310"
  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  timeout = 120
  entry_point = "main"
  trigger_http = true

  environment_variables = {
    FUNCTION_REGION = "us-central1"
    PROJECT_ID = "project-gcp-srp-hw"
    OUTPUT_TABLE = google_bigquery_table.table_tf.table_id
    OUTPUT_DATASET = google_bigquery_dataset.dataset_tf.dataset_id
    TOPIC_NAME = "topic-gcp-srp-hw"
  }
}

# Define the invoker for all users
resource "google_cloudfunctions_function_iam_member" "invoker" {
  cloud_function = google_cloudfunctions_function.function.name
  role = "roles/cloudfunctions.invoker"
  member = "allUsers"
}

# Define the dataset for BigQuery
resource "google_bigquery_dataset" "dataset_tf" {
  dataset_id = "dataset-gcp-srp-hw"
  friendly_name = "hw_dataset"
  description = "Home Work 1 dataset"
  location = "US"
  default_table_expiration_ms = 3600000
}

# Define the table for BigQuery
resource "google_bigquery_table" "table_tf" {
  table_id = "table-gcp-srp-hw"
  dataset_id = google_bigquery_dataset.dataset_tf.dataset_id
  deletion_protection = false
  schema = file("schemas/task-cf.json")
}

# Define the PubSub topic
resource "google_pubsub_topic" "topic_tf" {
  name = "topic-gcp-srp-hw"
  message_retention_duration = "86600s"
}

# Define the PubSub subscription
resource "google_pubsub_subscription" "subscription_tf" {
  name = "subscription-gcp-srp-hw"
  topic = google_pubsub_topic.topic_tf.name
  message_retention_duration = "1200s"
  retain_acked_messages = true
}

# Define the GitHub trigger
resource "google_cloudbuild_trigger" "github_trigger" {
  project = "project-gcp-srp-hw"
  name = "trigger-gcp-srp-hw"
  filename = "cloudbuild.yaml"

  github {
    owner = "romanmurzac"
    name = "google-cloud"
    push {
      branch = "^main"
    }
  }
}
