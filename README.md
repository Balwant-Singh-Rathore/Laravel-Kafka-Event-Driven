<p align="center">
    <img src="https://blog.min.io/content/images/2021/09/1_kqpVTzo8b0e2oKdOjWQxZA.png" alt="Kafka Logo" width="200">
</p>

# Laravel Kafka Event-Driven 🚀

A repository demonstrating how to sync two databases using Kafka and Debezium CDC (Change Data Capture) process in a Laravel environment.

## 🌟 Overview

This repository showcases the implementation of an event-driven architecture to synchronize data between two databases using Apache Kafka and Debezium CDC. The system consists of the following components:

- 🚀 **Kafka**: A distributed event streaming platform that allows high-throughput, fault-tolerant, and scalable data processing.
- 🔀 **Debezium**: An open-source CDC platform that captures row-level changes from MySQL and publishes them to Kafka topics as events.
- ⚙️ **Laravel**: A powerful PHP framework for building web applications, used to consume and process the Kafka events.

## 📦 Prerequisites

To run this project locally, ensure that you have the following dependencies installed:

- Apache Kafka
- Debezium Connector for MySQL
- PHP
- Laravel
- MySQL

## ⚙️ Setup

1. Clone the repository:

```bash
git clone https://github.com/Balwant-Singh-Rathore/Laravel-Kafka-Event-Driven
```

2. composer install:

```bash
composer install
```

3. Create .env and connect your local database to Laravel application
4. composer install:

```bash
php artisan migrate
```

5. Run ./start.sh and wait to finish script:

```bash
./start.sh
```

6. Run kafka consume command to comsume kafka message

```bash
php artisan kafka:consume
```

7. For Testing:
   Connect to the Docker MySQL database, make changes to the movies table records, and witness real-time synchronization
   of the records in your local database movies table. 🎉 🎉

9. Stop:
```bash
./stop_and_destroy.sh
```

