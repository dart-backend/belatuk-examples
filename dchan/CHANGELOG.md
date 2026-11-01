# Change Log

## 6.0.0

### Breaking changes in 6.0.0

* **Breaking:** Requires Dart 3.13 or later, and uses Angel3 10 (`angel3_*` ^10.0.0)

### Fixes in 6.0.0

* **Server:** Runs without `dart:mirrors`, so `bin/prod.dart` can be compiled with `dart compile exe`, as it needs no reflector
* **Posts:** Posting works with Angel3 10, as the ORM runs through `PostgreSqlExecutor` over the pool of connections; `PostgreSqlPoolExecutor` of `angel3_orm_postgres` 10.0.1 fails to insert

## 5.1.0

* Required Dart >= 3.9.x
* Updated lints to 6.x.x

## 5.0.0

* Upgrade to Angel3 8.x.x
* Required Dart >= 3.x.x
* Updated to lints 4.x.x

## 4.0.0

* Upgrade to Angel3 7.x.x
* Required Dart >= 2.18.x

## 3.0.0

* Upgrade to Angel3 6.x.x
* Required Dart >= 2.16.x

## 2.1.0

* Upgraded to `package:lints` linter
* Updated to use `package:belatuk_pretty_logging`

## 2.0.1

* Updated `angel3` packages

## 2.0.0

* Migrated to `angel3` packages

## 1.0.0

* Initial version for Dart SDK 2.10.x and below
