terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "java_image" {
  name = "java_image"
  build {
    context    = path.module
    dockerfile = "Dockerfile"
  }
}

resource "docker_container" "java_container" {
  name  = "java-container"
  image = docker_image.java_image.latest

  mounts {
    target = "/src"
    source = abspath("${path.module}/src")
    type   = "bind"
  }
  ports {
    internal = 8080
    external = 8080
  }
}

# for nginx
# resource "docker_image" "nginx" {
#   name         = "nginx:latest"
#   keep_locally = true
# }

# resource "docker_container" "nginx_container" {
#   name  = "nginx-container"
#   image = docker_image.nginx.latest
#   ports {
#     internal = 80
#     external = 8080
#   }
# }


# terraform { 
#   cloud { 

#     organization = "Joza" 

#     workspaces { 
#       name = "java-hello" 
#     } 
#   }

#   required_providers {
#     local = {
#       source  = "hashicorp/local"
#       version = "~> 2.0"
#     }
#   }
# }

# provider "local" {}

# resource "local_file" "example" {
#   filename = "example.txt"
#   content  = "Hello, Terraform Cloud!"
# }