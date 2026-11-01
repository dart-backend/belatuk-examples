# Change Log

## 6.0.0

### Breaking changes in 6.0.0

* **Breaking:** Requires Dart 3.13 or later, and uses Angel3 10 (`angel3_*` ^10.0.0)

### Fixes in 6.0.0

* **Server:** Runs without `dart:mirrors`, so `bin/prod.dart` can be compiled with `dart compile exe`, as it needs no reflector

## 5.1.0

* Required Dart >= 3.9.x
* Updated lints to 6.x.x

## 5.0.0

* Required Dart >= 3.x.x
* Upgrade to Angel3 8.x.x

## 4.0.0

* Required Dart >= 2.18.x
* Upgrade to Angel3 7.x.x

## 3.0.0

* Updated to Angel3 version 6
* Updated to SDK 2.16.x

## 2.1.0

* Upgraded from `pedantic` to `lints` linter
* Fixed NNBD issues
* Refactored the code into recommended project structure

## 2.0.0

* Migrated to support Dart SDK 2.12.x NNBD

## 1.0.0

* Initial version
