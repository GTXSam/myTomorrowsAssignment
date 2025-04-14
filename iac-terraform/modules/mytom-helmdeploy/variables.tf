locals {
    fullrelease_name = lower("${var.release_name}-${var.mytom_env}")

    chart_remote = !(substr(var.chart_name, 0, 2) == "./" || substr(var.chart_name, 0, 1) == "/" )
}

variable "mytom_env"{
    description = "environment"
    type = string

    validation {
        condition     = contains(["test", "qa", "prod"], var.mytom_env)
        error_message = "Valid values for environment are (test, qa, prod)"
    }
}

variable "release_name" {
    description = "Release name"
    type = string
}

variable "chart_name" {
    description = "Chart name"
    type = string
}

variable "chart_version" {
    description = "Version"
    type = string
}

variable "repository" {
    description = "Repository"
    type = string
}

variable "values_path" {
    description = "values_path"
    type = list
}

variable "force_update" {
    description = "Force update?"
    type = bool
}

variable "replace_release" {
    description = "Replace?"
    type = bool
}

variable "namespace" {
    description = "namespace"
    type = string
}

variable "atomic"{
    description = "atomic"
    type = bool
}

variable "replicas" {
  description = "Number of replicas for MyTomApp"
  type        = number
  default     = 1
}

variable "cleanup_on_fail" {
    description = "Cleanup on failed deploy"
    type = bool
}

variable "hpa_enabled" {
    description = "HPA Enabled?"
    type = bool
    default = null
}

variable "hpa_minReplicas" {
    description = "HPA Min Replicas"
    type = string
    default = null
}

variable "hpa_maxReplicas" {
    description = "HPA Max Replicas"
    type = string
    default = null
}

variable "pdb_enabled" {
    description = "PDB Enabled?"
    type = bool
    default = null
}

variable "pdb_minAvailablePDB" {
    description = "min Available PDB"
    type = string
    default = null
}


