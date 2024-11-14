terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}

provider "docker" {}

resource "docker_image" "angelocho" {
  name         = "${var.docker_image_name}${var.docker_image_version}"
  keep_locally = false
}

resource "docker_container" "angelocho_container" {
  image = docker_image.angelocho.image_id
  name  = var.docker_container_name
  dynamic "ports" {
    for_each = var.docker_ports
    content {
      internal = ports.value.internal
      external = ports.value.external
    }
  }
  restart = "always"
}
