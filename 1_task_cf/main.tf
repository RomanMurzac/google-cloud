terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      version = "4.51.0"
    }
  }
}

provider "google" {
  project = "project-gcp-srp-hw"
  region = "us-central1"
  zone = "us-central1-c"
  credentials = "project-gcp-srp-hw-085eccd0cd34.json"
}

resource "google_storage_bucket" "bucket" {
  name = "bucket-gcp-srp-hw-1"
  location = "us-central1"
}

resource "google_storage_bucket_object" "archive" {
  name = "source.zip"
  bucket = google_storage_bucket.bucket.name
  source = "function.zip"
}

resource "google_cloudfunctions_function" "function" {
  name = "function-gcp-srp-hw"
  description = "Function for HW 1"
  runtime = "python38"

  available_memory_mb = 128
  source_archive_bucket = google_storage_bucket.bucket.name
  source_archive_object = google_storage_bucket_object.archive.name
  trigger_http = true
  timeout = 60
  entry_point = "main"
  labels = {
    "hw-1": "hw-1-value"
  }
  environment_variables = {
    MY_ENV_VAR = "my-env-var-value"
  }
}

resource "google_cloudfunctions_function_iam_member" "invoker" {
  cloud_function = google_cloudfunctions_function.function.name
  role = "roles/cloudfunctions.invoker"
  member = "allUsers"
}

resource "google_bigquery_dataset" "dataset_tf" {
  dataset_id = "dataset_gcp_srp_hw"
  friendly_name = "hw_dataset"
  description = "Home Work 1 dataset"
  location = "us-central1"
  default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }
}

resource "google_bigquery_table" "table_tf" {
  table_id = "table-gcp-srp-hw"
  dataset_id = google_bigquery_dataset.dataset_tf.dataset_id
  deletion_protection = false

  labels = {
    env = "default"
  }
}