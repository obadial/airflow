FROM python:3.9.0-slim

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    DEBIAN_FRONTEND=noninteractive


RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential libssl-dev libffi-dev \
    krb5-user libkrb5-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*


# Installer Poetry avec pip
RUN pip install --no-cache-dir poetry

# Créer l'utilisateur airflow
RUN useradd -m airflow

# Définir le répertoire de travail
RUN mkdir /airflow
WORKDIR /airflow

# Copier les fichiers nécessaires
COPY --chown=airflow pyproject.toml /airflow/pyproject.toml
COPY --chown=airflow poetry.lock /airflow/poetry.lock
COPY --chown=airflow dags /airflow/dags
COPY --chown=airflow local /airflow/local
COPY --chown=airflow Makefile /airflow/Makefile
COPY --chown=airflow logs /airflow/logs
COPY --chown=airflow plugins /airflow/plugins
COPY --chown=airflow config /airflow/configs

# Installer les dépendances avec Poetry
RUN poetry config virtualenvs.create false \
    && poetry install

# Vérifier l'installation d'Airflow
RUN poetry run airflow version

# Définir l'utilisateur par défaut
USER airflow



