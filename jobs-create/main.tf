provider "jenkins" {
  server_url = "https://172.31.10.206:8080"
  username   = "admin"
  password   = "admin123"
}

terraform {
  required_providers {
    jenkins = {
      source = "registry.terraform.io/taiidani/jenkins"
    }
  }
}

resource "jenkins_folder" "folder" {
  count       = length(var.folders)
  name        = element(var.folders, count.index)
  description = element(var.folders, count.index)
}

