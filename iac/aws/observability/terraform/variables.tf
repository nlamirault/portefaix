# Copyright (C) 2020 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#############################################################################
# Provider

variable "region" {
  type        = string
  description = "AWS Region"
}

#############################################################################
# Observability

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
}

# Prometheus

variable "prometheus_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "prometheus_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "prometheus_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "made-by" = "terraform"
  }
}

# Thanos

variable "thanos_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "thanos_service_accounts" {
  type        = list(string)
  description = "The Kubernetes service account"
}

variable "thanos_tags" {
  type        = map(string)
  description = "Tags for Thanos"
  default = {
    "made-by" = "terraform"
  }
}

# Loki

variable "loki_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "loki_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "loki_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "made-by" = "terraform"
  }
}

# Tempo

variable "tempo_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "tempo_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "tempo_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "made-by" = "terraform"
  }
}

# Grafana

variable "grafana_namespace" {
  type        = string
  description = "The Kubernetes namespace"
}

variable "grafana_service_account" {
  type        = string
  description = "The Kubernetes service account"
}

variable "grafana_tags" {
  type        = map(string)
  description = "Tags for Loki"
  default = {
    "made-by" = "terraform"
  }
}
