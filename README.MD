# Proyecto de laboratorio de la semana 03: Infraestructura como Código con Terraform

## Descripción

En este proyecto se nos pide implementar un entorno de servidor web utilizando Terraform y Docker.
Para realizar esto se despliegaran dos contenedores de Nginx, cada uno expuesto en diferentes puertos.
Lo que nos permitira probar la infraestructura de forma local.

## Integrante del Proyecto de Laboratorio de la Semana 03

Guanilo Esteves Luis Angel

## Requisitos para la implementacion de este laboratorio

- Tener Docker instalado y corriendo.
- Terraform instalado en tu máquina local.
- Acceso a la terminal de comandos.
- Github iniciadio y configurado a un repositorio

## Instrucciones del Desarrollo de Laboratorio de la Semana 03

1. Clonar o iniciar el repositorio de Git
2. Abrir el proyecto (carpeta)
3. Inicializar terraform (terraform init)
4. Revisar el plan de despliegue (terraform plan)
5. Aplicar el despliegue (terraform apply)

## Despliegue
Al realizar el despliegue de los dos contenedores sugeridos en el enunciado considero lo siguiente:
- Contenedor 1 con nombre Server_web con puerto externo 4005 y puerto interno 80
- Contenedor 2 con nombre Server_web_2 con puerto externo 4006 y puerto interno 80

## Verificacion
- Para poder verificar si realmente se realizo el despliegue se corre el siguiente comando
docker ps
- Este comando me permite ver los contenedores que estan en ejecucion y deben de visualizarse tanto server_web como server_web_2
- para verificar que estan en ejecucion en un navegador accedemos a las siguientes direcciones
        http://localhost:4005
        http://localhost:4006
 - La primera direccion accede al primer contenedor que es server_web en el puerto 4005
 - La Segunda direccion accede al segundo contenedor que es server_web_2 en el puerto 4006
 - Ambas direcciones deben acceder a la pagina de imagen de nginx, en todo caso algun error la pagina no deberia de cargarse.
 
===================================================================================
===================================================================================


 # Tarea de Terraform Variables y Entornos

 Sobre la Tarea anterior Ahora debemos desplegar con variables configuradas y desplegar dos recursos

 Se nos proporciona un codigo como base:
 en el archivo mai.tf(modificar el archivo ya desplegado de la tarea anterior)
 name  = "server_web"
  image = "nginx:latest"
  ports {
    external = var.web_server_port
    internal = 80
  }
}

en el terraform.tfvars (crear)
web_server_port = 4008


y variables.tf (crear)
variable "web_server_port" {
  description = "Puerto de entrada del servidor web"
  type        = number
  default     = 4007
}

1. crear los archivos variables.tf y terraform.tfvars
2. se integra la codificacion en cada archivo (variables.tf y terraform.tfvars)
3. se adiciona codigo al archivo main.tf segun el codigo proporcionado, modificanco el main.tf para que despliegue dos contenedores usando variable en una y la otra sigue con valor fijo.
4. luego iniciamos con terraform init y luego terraform plan, y finalmente con terraform apply.
5. respondemos con yes, y ya tenemos dos recursos desplegados usando variables en un contenedor y fijo en otro contenedor
Lo siguiente es  la confirmacion al momento de ejecutar el terraform apply
##
docker_container.container_server_web: Destroying... [id=4305e37b99c5efe5c5f5f215fa7f96c91023d971fde2d0ba2f468c7a1c0241b5]
docker_container.container_server_web_2: Destroying... [id=f3f0a7c6b489438b2f91b2ce71d329271a4269fcdef1345c20b58a85b8a9645a]
docker_container.container_server_web: Destruction complete after 1s
docker_container.container_server_web: Creating...
docker_container.container_server_web_2: Destruction complete after 1s
docker_container.container_server_web_2: Creating...
docker_container.container_server_web: Creation complete after 2s [id=fff9b2bb7485ad9e305f469dd3ce8bed78e86203e7581f4f1fa3f84be9586271]
docker_container.container_server_web_2: Creation complete after 2s [id=67314ea7e3d96377fda7f3aad8d7c947be03f575cbc56a807f21f8200dbbc42f]        

Apply complete! Resources: 2 added, 0 changed, 2 destroyed.
##

# verificar la ejecucion de los contenedores
docker ps
la salida o respuesta de esta linea de comando es la siguiente

67314ea7e3d9   nginx:latest   "/docker-entrypoint.…"   5 minutes ago   Up 5 minutes   0.0.0.0:4009->80/tcp   server_web_2
fff9b2bb7485   nginx:latest   "/docker-entrypoint.…"   5 minutes ago   Up 5 minutes   0.0.0.0:4008->80/tcp   server_web

ademas de tener respuestas afirmativas de ejecucion a los comandos
 curl http://localhost:4008
 curl http://localhost:4009

 dando respuesta correcta tanto en la terminal como en navegador web

