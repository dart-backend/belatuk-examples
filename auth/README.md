# Auth Backend Application

A simple example of user authentication in Angel3 that stores a token in a `token` cookie

## Installation and Configuration

1. Open a terminal and go to `backend` directory
2. Run:

    ```bash
    dart pub get
    ```

3. Run:

    ```bash
        dart bin/main.dart
    ```

4. Open `http://localhost:3000` in a browser

## Logging in

Log in as `demo` with `demo123`, or `admin` with `admin123`, as in `bin/main.dart`, to see `/secret.html`, and log out with its button. A login lasts an hour.

The JWTs of the logins are signed with the key in the `JWT_SECRET` environment variable, which must stay secret, as anyone who knows it can sign a JWT for any user:

```bash
JWT_SECRET=<a long random string> dart bin/main.dart
```

Without it, a random key is used, so the logins end when the server restarts. In production (`ANGEL_ENV=production`), it is required.
