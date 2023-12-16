FROM python:3.9-slim

RUN apt-get update && apt-get install -y \
    libpq-dev

RUN pip install --no-cache-dir poetry

WORKDIR /airflow


COPY pyproject.toml .
COPY poetry.lock .


RUN poetry config virtualenvs.create false \
    && poetry install --no-dev


COPY dags ./dags/
COPY local ./local/
COPY Makefile .


EXPOSE 8080


CMD ["airflow", "web"]