# Change Log

## 6.0.0

### Breaking changes in 6.0.0

* **Breaking:** Requires Dart 3.13 or later, and uses Angel3 10 (`angel3_*` ^10.0.0)

### Fixes in 6.0.0

* **Server:** A `sign_in` or `message` of data that is not valid is answered with an error event, where it stopped the server
