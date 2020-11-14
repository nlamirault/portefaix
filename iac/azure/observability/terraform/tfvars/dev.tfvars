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

############################################################################
# Provider

resource_group_name = "portefaix-dev"

##############################################################################
# Obervability

aks_resource_group_name = "portefaix-dev"

# Prometheus

prometheus_resource_group_name     = "prometheus-dev"
prometheus_resource_group_location = "West Europe"

prometheus_storage_account_name   = "prometheusk8s"
prometheus_storage_container_name = "prometheus-dev"

prometheus_tags = {
    "made-by" = "terraform"
    "service" = "prometheus"
    "project" = "portefaix"
    "env"     = "dev"
}

# Thanos

thanos_resource_group_name     = "thanos-dev"
thanos_resource_group_location = "West Europe"

thanos_storage_account_name   = "thanosk8s"
thanos_storage_container_name = "thanos-dev"

thanos_tags = {
    "made-by" = "terraform"
    "service" = "thanos"
    "project" = "portefaix"
    "env"     = "dev"
}

# Loki

loki_resource_group_name     = "loki-dev"
loki_resource_group_location = "West Europe"

loki_storage_account_name   = "lokik8s"
loki_storage_container_name = "loki-dev"

loki_tags = {
    "made-by" = "terraform"
    "service" = "loki"
    "project" = "portefaix"
    "env"     = "dev"
}

# Tempo

tempo_resource_group_name     = "tempo-dev"
tempo_resource_group_location = "West Europe"

tempo_storage_account_name   = "tempok8s"
tempo_storage_container_name = "tempo-dev"

tempo_tags = {
    "made-by" = "terraform"
    "service" = "tempo"
    "project" = "portefaix"
    "env"     = "dev"
}