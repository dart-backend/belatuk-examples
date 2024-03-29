# Pub_serve_proxy

A reverse proxy application build with `angel3_proxy` package serving contents from HTTP server, including WebSocket support, so it can be used with `webpack-dev-server` and co. as well.

## Build

1. Open a terminal and run:

    ```bash
    dart pub get
    ```

## For Development

1. In the first terminal, run the proxy server which listen on port 3000.

    ```bash
    dart bin/main.dart
    ```

2. In the second terminal, run the web server which listn on port 8080.

    ```bash
    pub run build_runner serve
    ```

3. Open `http://localhost:3000` in a browser

## For Production

1. In the first terminal, run the proxy server which listen on port 3000.

    ```bash
    set ANGEL_ENV=production 
    dart bin/main.dart
    ```

2. In the second terminal, run the web server to serve static files, including our dart2js-compiled app on port 8080.

    ```bash
    pub run build_runner build --release -o build
    ```

3. Open `http://localhost:3000` in a browser
