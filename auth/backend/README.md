# A simple web application

A simple web application with user authentication in Angel3 that stores access token in a `token` cookie

## Build

1. Open a terminal and run:

    ```bash
    dart pub get
    ```

2. Open a terminal and run the following command:

    ```bash
        dart bin/main.dart
    ```

3. Open `http://localhost:3000` in a browser

## Logging in

Log in as `demo` with `demo123`, or `admin` with `admin123`, as in `bin/main.dart`, to see `/secret.html`, and log out with its button. A login lasts an hour.

The JWTs of the logins are signed with the key in the `JWT_SECRET` environment variable, which must stay secret, as anyone who knows it can sign a JWT for any user:

```bash
JWT_SECRET=<a long random string> dart bin/main.dart
```

Without it, a random key is used, so the logins end when the server restarts. In production (`ANGEL_ENV=production`), it is required.

You could try https://pub.dev/packages/shelf or https://github.com/dukefirehawk/angel  (https:\\angel3-framework.web.app)


