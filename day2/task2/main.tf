terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
    image = docker_image.nginx.name
    name  = "nginx-tf"
    ports {
        internal = 80
        external = 81
    }
}