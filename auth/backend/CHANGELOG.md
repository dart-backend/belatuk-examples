
# Change Log

## 6.0.0

### Breaking changes in 6.0.0

* **Breaking:** Requires Dart 3.13 or later, and uses Angel3 10 (`angel3_*` ^10.0.0)

### Fixes in 6.0.0

* **Security:** The JWTs are signed with the key of the `JWT_SECRET` environment variable, which is required in production, where the key was in the code, so anyone could sign a JWT for any user. Without it, in development, a random key is used
* **Security:** A JWT holds the username only, and its user is looked up for each request, where it held the user's password hash and was trusted as it was; a JWT of a user who no longer exists is refused
* **Security:** A JWT expires after an hour, where it never did, and `POST /logout` logs out
* **Security:** `/secret.html` is protected for every method, as `HEAD`, and sent with `Cache-Control: no-store`, where it was cached
* **Security:** A log in takes as long for an unknown username as for a known one, and is not logged with the username, so it does not tell which usernames exist
* **Redirects:** A logged-in user who opens `/login.html` is sent home, and a guest refused a page is sent to log in, where they were sent to `/forbidden.html`; other clients than browsers get the error
* **Pages:** `login.html` has a title of its own and a charset; the unrelated `bin/example.dart` is removed

## 5.1.0

* Required Dart >= 3.9.x
* Updated lints to 6.x.x

## 5.0.0

* Updated to Angel3 8.x.x
* Required Dart >= 3.x.x
* Updated to lints 4.x.x

## 4.0.0

* Updated to Angel3 7.x.x
* Required Dart >= 2.18.x

## 3.0.1

* Updated to lints 2.x.x

## 3.0.0

* Updated to Angel3 6.x.x
* Require Dart >= 2.16.x

## 2.1.0

* Upgraded from `pedantic` to `lints` linter

## 2.0.1

* Updated `angel3` packages
  
## 2.0.0

* Migrated to `angel3` packages

## 1.0.0

* Initial version for Dart SDK 2.10.x and below
