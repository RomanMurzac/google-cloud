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
  project = var.project_id
  region = var.region
  zone = var.zone
}


# Define the AF bucket
resource "google_storage_bucket" "bucket_af" {
  name = var.bucket_name
  location = var.location
}

# Define the AF dataset for BigQuery
resource "google_bigquery_dataset" "dataset_af" {
  dataset_id = var.af_dataset_id
  description = "BigQuery Dataset fo AF task"
  location = var.location
  default_table_expiration_ms = 3600000
}

# Define the AF table for BigQuery
resource "google_bigquery_table" "table_af" {
  table_id = var.af_table_id
  dataset_id = google_bigquery_dataset.dataset_af.dataset_id
  deletion_protection = false
  schema = file("schemas/task-af.json")
}

substitutions = {
    "_COMPOSER_ENV_NAME": var.composer_name,
    "_COMPOSER_LOCATION": var.composer_location,
    "_APP": var.application_name
}
