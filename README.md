Buenas, esto es un repositorio CI/CD automatizado con Jenkins, Terraform, Docker y Ansible.
Con este flujo:

Jenkins automatiza la construcción, el despliegue y la configuración de la infraestructura de contenedores.
Terraform despliega y gestiona los contenedores Docker.
Ansible aprovisiona configuraciones adicionales dentro de los contenedores.

### REQUISITOS
Tener instalado Docker y Docker Compose
Tener acceso a **Docker Desktop** en el sistema operativo Windows (o Docker de manera general en otro sistema operativo).
Tener instalado Terraform

HABER CONFIGURADO LA EJECUCION REMOTA EN DOCKER DESKTOP ->

Habilitar la API remota modificando la configuración de Docker Desktop
Abra Docker Desktop en su máquina Windows.
Haga clic en el icono de engranaje en la esquina superior derecha para abrir Configuración.
Vaya a la pestaña General.
Desplácese hacia abajo y active Expose daemon on tcp://localhost:2375 without TLS. Esto permitirá a Docker escuchar en el puerto 2375 sin requerir encriptación SSL/TLS. Nota: Esto no es seguro y sólo se recomienda para redes locales o internas.
Haga clic en Aplicar y reiniciar.
Docker Desktop escuchará ahora en el puerto 2375 para conexiones TCP, y podrá acceder a él remotamente utilizando tcp://localhost:2375.

### Pasos para ejecutar

1. Clona este repositorio en tu máquina.
2. Coloca tus playbooks de Ansible en la carpeta `JenkinsyAnsible/ansible/`.
3. Dentro de `JenkinsyAnsible/`, ejecuta:

   ```bash
   docker-compose up -d