# Usamos la imagen oficial de Jenkins LTS como base
FROM jenkins/jenkins:lts

# Cambiamos al usuario root para poder instalar Docker, Terraform y Ansible
USER root

# Actualizar los paquetes y añadir dependencias necesarias para Docker, Terraform y Ansible
RUN apt-get update && \
    apt-get -y install apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    lsb-release \
    unzip \
    python3-pip \
    python3-dev \
    sudo && \

    # Instalación de Docker - Usamos Ubuntu 20.04 (focal) para evitar el problema con Bookworm
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | tee /etc/apt/trusted.gpg.d/docker.asc && \
    echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" > /etc/apt/sources.list.d/docker.list && \
    apt-get update && \
    apt-get -y install docker-ce && \

    # Instalación de Docker Compose
    curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \

    # Instalación de Terraform
    curl -fsSL https://apt.releases.hashicorp.com/gpg | tee /etc/apt/trusted.gpg.d/hashicorp.asc && \
    echo "deb [arch=amd64] https://apt.releases.hashicorp.com focal main" > /etc/apt/sources.list.d/hashicorp.list && \
    apt-get update && \
    apt-get install -y terraform && \

    # Instalación de Ansible
    apt-get install -y ansible && \
    apt-get install -y sshpass && \
    # Agregar el usuario de Jenkins al grupo Docker para permitirle ejecutar Docker sin sudo
    usermod -aG docker jenkins

# Regresamos al usuario Jenkins para las operaciones posteriores
USER jenkins

# Exponer el puerto de Jenkins
EXPOSE 8080