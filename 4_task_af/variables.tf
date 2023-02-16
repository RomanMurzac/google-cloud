variable "project_id" {
  default = "project-work-gcp"
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
