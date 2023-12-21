FROM debian:stable-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1

# Installation des dépendances système, des certificats SSL et des outils de développement Kerberos
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libssl-dev zlib1g-dev libbz2-dev libreadline-dev \
    libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev liblzma-dev git ca-certificates \
    krb5-user libkrb5-dev \
    && rm -rf /var/lib/apt/lists/*

# Télécharger et installer Python 3.9.0
RUN wget https://www.python.org/ftp/python/3.9.0/Python-3.9.0.tgz \
    && tar -xvf Python-3.9.0.tgz \
    && cd Python-3.9.0 \
    && ./configure --enable-optimizations \
    && make -j 4 \
    && make altinstall \
    && cd .. && rm -rf Python-3.9.0.tgz Python-3.9.0

# Installer pip pour la version de Python installée
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py \
    && python3.9 get-pip.py \
    && rm get-pip.py

# Installer Poetry avec pip
RUN pip install --no-cache-dir poetry


WORKDIR /airflow


COPY pyproject.toml .
COPY poetry.lock .


RUN poetry config virtualenvs.create false \
    && poetry install --no-dev

RUN poetry run airflow version


COPY dags ./dags/
COPY local ./local/
COPY Makefile .
