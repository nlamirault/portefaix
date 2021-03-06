# Copyright (C) 2018-2021 Nicolas Lamirault <nicolas.lamirault@gmail.com>
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

data "sops_file" "data" {
  source_file = var.secret_filename
}

#output "sops_data" {
#  value = data.sops_file.data
#}

data "kubernetes_namespace" "vouch_proxy" {
  metadata {
    name = var.chart_namespace
  }
}

resource "helm_release" "vouch_proxy" {
  name       = var.chart_release_name
  namespace  = data.kubernetes_namespace.vouch_proxy.metadata.0.name
  repository = var.chart_repository
  chart      = var.chart_name
  version    = var.chart_version

  values = [
    file(local.chart_commons_values_filename),
    file(var.chart_values_filename),
    data.sops_file.data.raw
  ]

}
