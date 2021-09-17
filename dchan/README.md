# dchan

A simple, anonymous text/multimedia board build with Angel3 framework

![screenshot](screenshots/screenshot.png)

Supports:

* Markdown
* Uploads
* Audio/video playback
* Image embedding
* User hashes instead of username/password

## Setup & Usage

You need Dart and PostgreSQL installed.

### Setup database

* Open psql terminal and run the following command to create a new database:

```sql
    CREATE USER dchan PASSWORD 'Dchan@1970';
    CREATE DATABASE dchan_db OWNER dchan ENCODING 'UTF-8';
    GRANT ALL ON DATABASE dchan_db TO dchan; 
```

* To use different database, username or password, update `config/default.yaml` file

* Run `dart bin/migrate.dart up` to generate the required tables in the database.

### Run

* Run `dart bin/prod.dart` to start the server.

* Open a browser and run <http://localhost:3000>
