Buenas, esto es un repositorio CI/CD automatizado con Jenkins, Terraform, Docker y Ansible.
Con este flujo:

Jenkins automatiza la construcción, el despliegue y la configuración de la infraestructura de contenedores.
Terraform despliega y gestiona los contenedores Docker.
Ansible aprovisiona configuraciones adicionales dentro de los contenedores.

### REQUISITOS
Tener instalado Docker y Docker Compose
Tener acceso a **Docker Desktop** en el sistema operativo Windows (o Docker de manera general en otro sistema operativo).
Tener instalado Terraform

### Pasos para ejecutar

1. Clona este repositorio en tu máquina.
2. Coloca tus playbooks de Ansible en la carpeta `JenkinsyAnsible/ansible/`.
3. Dentro de `JenkinsyAnsible/`, ejecuta:

   ```bash
   docker-compose up -d