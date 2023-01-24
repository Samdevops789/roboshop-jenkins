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

resource "jenkins_job" "infra-jobs" {
  depends_on = [jenkins_folder.folder]
  count      = length(var.infra-jobs)
  name       = element(var.infra-jobs, count.index)
  folder     = "/job/infrastructure"
  template = templatefile("${path.module}/pipeline-job.xml", {
    git_repo = element(var.infra-jobs, count.index)
  })
}

resource "jenkins_job" "app-jobs" {
  depends_on = [jenkins_folder.folder]
  count      = length(var.app-jobs)
  name       = element(var.app-jobs, count.index)
  folder     = "/job/applications"
  template = templatefile("${path.module}/multi-branch-job.xml", {
    git_repo = element(var.app-jobs, count.index)
  })
}