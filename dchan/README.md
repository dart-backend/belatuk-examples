# dchan

A simple, anonymous text/multimedia board build with Angel3 framework

![screenshot](screenshots/screenshot.png)

Supports:

* Markdown
* Uploads
* Audio/video playback
* Image embedding
* User hashes instead of username/password

## Settings

### Database Setup (Postgresql)

1. Open `psql` terminal and run the following command:

    ```sql
        CREATE USER dchan PASSWORD 'Dchan@1970';
        CREATE DATABASE dchan_db OWNER dchan ENCODING 'UTF-8';
        GRANT ALL ON DATABASE dchan_db TO dchan; 
    ```

2. To use different database, username or password, update `config/default.yaml` file

3. Run `dart bin/migrate.dart up` to generate the required tables in the database.

## For Development and Production

1. Open a terminal and run the following command

    ```bash
        dart bin/prod.dart
    ```

2. Open `http://localhost:3000` in a browser
