terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "npipe:////./pipe/docker_engine"
}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "web_server" {
  name  = "terraform-nginx-container"
  image = docker_image.nginx.image_id
  ports {
    internal = 80
    external = 8888
  }
}

output "container_info" {
  value = {
    name = docker_container.web_server.name
    port = 8888
    url  = "http://localhost:8888"
  }
}