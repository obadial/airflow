# Airflow 2.10 Testing Project

This project is designed to test Apache Airflow 2.10 using Docker, Poetry, and a Makefile for streamlined management.

## Prerequisites

- Docker
- Docker Compose
- Poetry
- Make

## Project Structure

```
airflow-testing/
├── local/
│   └── docker-compose.yaml
├── Makefile
├── poetry.lock
├── pyproject.toml
└── README.md
```

## Setup

1. **Clone the repository:**

   ```sh
   git clone <repository-url>
   cd airflow-testing
   ```

2. **Install dependencies using Poetry:**

   ```sh
   poetry install
   ```

## Usage

### Start Airflow

To start the Airflow services, run:

```sh
make up
```

This command builds and starts the Docker containers defined in `local/docker-compose.yaml`.

### Stop Airflow

To stop and remove the Airflow containers, run:

```sh
make down
```

### Restart Airflow

To restart the Airflow services, run:

```sh
make re
```

This command stops the containers and then starts them again.

## Docker Compose Configuration

The Docker Compose configuration is located in `local/docker-compose.yaml`. This file defines the services required to run Airflow, including the web server, scheduler, and any other necessary components.

## Makefile Commands

- `make up`: Builds and starts the Docker containers.
- `make down`: Stops and removes the Docker containers.
- `make re`: Restarts the Docker containers by first stopping and then starting them.

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See thE) file for details.e [LICENSE](LICENS