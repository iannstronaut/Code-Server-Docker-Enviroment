# Menggunakan image dasar Debian Bullseye
FROM debian:bullseye

# Install dasar
RUN apt update && apt install -y \
    curl \
    git \
    vim \
    lsb-release \
    sudo \
    build-essential \
    unzip \
    ca-certificates \
    apt-transport-https \
    libpng-dev \
    libjpeg-dev \
    libfreetype6-dev \
    zip \
    php \
    php-cli \
    php-fpm \
    php-mysql \
    php-xml \
    php-json \
    php-curl \
    php-zip \
    php-mbstring \
    php-xmlrpc \
    php-gd \
    mariadb-client

# Install Python dan pip
RUN apt install -y python3 python3-pip python3-venv

# Install IPython
RUN pip3 install ipython

# Install BunJS
RUN curl -fsSL https://bun.sh/install | bash

# Menambahkan BunJS ke PATH
ENV PATH="/root/.bun/bin:$PATH"

# Install paket untuk VSCode (Code-Server)
RUN curl -fsSL https://code-server.dev/install.sh | sh

# Install Composer untuk Laravel
RUN curl -sS https://getcomposer.org/installer | php \
    && mv composer.phar /usr/local/bin/composer

# Menjalankan code-server pada port 8888
CMD ["code-server", "--bind-addr", "0.0.0.0:8888", "--auth", "none"]