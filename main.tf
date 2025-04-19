terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.16.0"
    }
  }
}

#proveedor Docker
provider "docker" {}


# primer contenedor: Nginx

resource "docker_container" "container_server_web" {
  name  = "server_web"
  image = "nginx:latest"

  ports {
    external = var.web_server_port   # en la tarea anterior fue 4005
    internal = 80
  }
}



# Segundo contenedor: Nginx, en el enunciado este contenedor sigue igual, por lo que sigue con numero fijo
resource "docker_container" "container_server_web_2" {
  name  = "server_web_2"
  image = "nginx:latest"

  ports {
    external = 4009 # valor fijo en contenedor 2
    internal = 80
  }
}


