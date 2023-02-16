variable "project_id" {
  default = "project-gcp-srp-hw"
  type = string
  description = "Project ID"
}

variable "location" {
  default = "US"
  type = string
  description = "Project Location"
}

variable "region" {
  default = "us-central1"
  type = string
  description = "Project Region"
}

variable "zone" {
  default = "us-central1-c"
  type = string
  description = "Project Zone"
}

variable "bucket_name" {
  default = "af-bucket-gcp-srp-hw"
  type = string
  description = "Storage Bucket name"
}

variable "af_dataset_id" {
  default = "af_dataset_gcp_srp_hw"
  type = string
  description = "BigQuery AF Dataset ID"
}


variable "af_table_id" {
  default = "af-table-gcp-srp-hw"
  type = string
  description = "BigQuery Table ID"
}

variable "composer_name" {
  default = "composer-gcp-srp-hw"
  type = string
  description = "Airflow Composer name"
}

variable "composer_location" {
  default = "us-east4"
  type = string
  description = "Airflow composer location"
}

variable "application_name" {
  default = "4_task_af"
  type = string
  description = "Airflow Task name"
}