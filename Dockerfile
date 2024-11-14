# Usar la imagen base de Ubuntu 22.04
FROM ubuntu:22.04

# Evitar preguntas durante la instalación
ENV DEBIAN_FRONTEND=noninteractive

# Actualizar los repositorios y paquetes
RUN apt-get update && apt-get upgrade -y

# Instalar dependencias necesarias
RUN apt-get install -y \
    software-properties-common \
    curl \
    git \
    lsb-release \
    sudo \
    openssh-server \
    ca-certificates \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    libsqlite3-dev \
    wget \
    libbz2-dev

# Instalar Python 3.11.2 desde el repositorio oficial (deadsnakes PPA)
RUN curl -sL https://deb.nodesource.com/setup_16.x | bash - && \
    apt-get update && apt-get install -y \
    python3.11 \
    python3.11-dev \
    python3.11-distutils \
    python3-pip

# Crear un enlace simbólico para que python3 apunte a python3.11
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.11 1

# Configurar el servidor SSH
RUN mkdir /var/run/sshd

# Crear un usuario (por ejemplo, "ansible") para usar SSH
RUN useradd -m ansible && echo "ansible:password" | chpasswd && adduser ansible sudo

# Asegúrate de que el puerto SSH está habilitado y permitir conexiones
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config

# Abrir el puerto 22 para SSH
EXPOSE 22

# Iniciar el servidor SSH cuando el contenedor se ejecute
CMD ["/usr/sbin/sshd", "-D"]
