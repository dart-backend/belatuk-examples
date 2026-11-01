# AI Context: belatuk-examples

Context for AI coding assistants working in this repository. Read this before making changes.

## What this is

Example applications for the [Angel3 framework](https://angel3-framework.web.app), each showing one kind of app (authentication, a board with an ORM, a Flutter chat over WebSockets, a reverse proxy, video streaming, GraphQL). They are read and copied by developers learning Angel3, so they should work as described in their READMEs and follow good practice.

- Repo: https://github.com/dukefirehawk/belatuk-examples (the README also links `dart-backend/belatuk-examples`)
- Dart SDK: `>=3.13.0 <4.0.0`
- Angel3 packages: `^8.0.0` (not yet upgraded to Angel3 10, as `boilerplates` and `belatuk` are)
- A [pub workspace](https://dart.dev/tools/pub/workspaces) managed with melos `^8.10.0`; the melos configuration is in the root `pubspec.yaml` (there is no `melos.yaml`)

## Examples

| Directory | Workspace package | What it shows | Notes |
|---|---|---|---|
| `auth/backend` | `auth` | Login with `angel3_auth` (local strategy, JWT in a `token` cookie), protected static pages | Has known security issues (see Gotchas) |
| `dchan` | `dchan` | Anonymous text/multimedia board: ORM on PostgreSQL, migrations, Jael views | Needs PostgreSQL (`config/default.yaml`, database `dchan_db`); `dart bin/migrate.dart up`; has a `Dockerfile` |
| `docs_examples/getting_started` | `hello_angel` | The code of the [Getting Started](https://angel3-docs.dukefirehawk.com/guides/getting-started) guide | |
| `flutter_chat/backend` | `backend` | WebSocket chat server (`angel3_websocket`) | |
| `flutter_chat/common` | `common` | Models shared by the chat's server and app (`angel3_serialize`) | |
| `flutter_chat/mobile` | `flutter_chat` | Flutter chat app (Riverpod 3) | The only Flutter package; see Gotchas |
| `pub_serve_proxy` | `pub_serve_proxy` | Reverse proxy (`angel3_proxy`) to a `build_runner serve` dev server, static files in production | |
| `star_wars/backend` | `star_wars` | GraphQL server (`angel3_graphql`, `graphql_server2`) | |
| `yewtube/backend` | `yewtube` | Video streaming, with a JSON file database (`angel3_file_service`, `db.json`) | |
| `shared/custom_bulma` | (none) | Sass source of a custom Bulma CSS | Not in the workspace; compiled with `compile-sass.dart` |

Each example has a README with how to run it, usually `dart bin/main.dart`, or `bin/dev.dart` and `bin/prod.dart`.

## Development Workflow

- **Setup**: the workspace includes a Flutter app, so it must be resolved with the Flutter SDK, and melos run with Flutter's own `dart`:

  ```bash
  flutter pub get
  <flutter>/bin/dart run melos bootstrap
  ```

  `dart pub get` or `dart run melos` with a Dart SDK installed apart from Flutter fail with "the Flutter SDK is not available". All examples share one resolution and the root `pubspec.lock`; an example's own `pubspec.lock` or `.dart_tool/` is deleted by pub.
- **Checks**: run in each example you changed, from its directory, with Flutter's `dart`:

  ```bash
  dart format --output=none --set-exit-if-changed .
  dart analyze
  ```

  There are almost no tests: only `flutter_chat/mobile/test/widget_test.dart`. Check a server change by running it as its README says.
- **Code generation**: after changing a model in `dchan`, `flutter_chat/common`, `star_wars/backend` or `yewtube/backend`, run `dart run build_runner build --delete-conflicting-outputs` in it, and commit the regenerated `*.g.dart`, which are committed so the examples run without it.
- **Adding an example**: add its directory to `workspace:` in the root `pubspec.yaml`, add `resolution: workspace` to its `pubspec.yaml`, and add it to the README's list of examples.
- **CI**: none. Run the checks locally.
- **Changelog**: Every user-facing change gets an entry in the affected package's `CHANGELOG.md`, written as plain-English statements about the package (not commit messages). Group a release's entries under `### Breaking changes in X.Y.Z` (each entry prefixed `**Breaking:**`), `### New in X.Y.Z` and `### Fixes in X.Y.Z`, in that order, omitting empty sections. Prefix each fix with a bold area label, e.g. `* **Services:** An invalid id is a 400`. Commit messages use [Conventional Commits](https://www.conventionalcommits.org/) (`type(scope): description`, `!` for breaking changes).

## Conventions

- The examples teach: comments explain what and why for developers learning Angel3, and link to the Angel3 docs where useful. Prefer the simplest code that shows the feature.
- Dependency constraints are aligned across the examples (e.g. `angel3_*: ^8.0.0`, `lints: ^6.0.0`, `file: ^7.0.1`). An Angel3 upgrade bumps every `angel3_*` dependency, and the matching `belatuk_*`, `graphql_*2` and generator versions, in all examples together.
- Code that is copied into apps should be safe to copy: no secrets in code, no sensitive data in tokens or logs.

## Gotchas

- **`flutter_chat/mobile` already has 2 analyzer errors**, from an outdated Riverpod 3 API in `lib/main.dart` and `lib/widgets/chat_home.dart`; they are not caused by the workspace. Other examples have warnings and infos only.
- **`auth/backend` has known security issues**, so do not present it as a model to copy until they are fixed: a hard-coded JWT secret, a deserializer that trusts the token's claims, the password hash in the JWT, tokens that never expire, a `GET`-only guard (`HEAD` is not protected), cache headers on the protected page, and username enumeration. Its `bin/example.dart` is an unrelated regex snippet.
- **Shared resolution**: as the examples resolve together, a dependency one of them needs at a new major version may conflict with another; upgrade them together.
- **IntelliJ files**: melos generates a `melos_<name>.iml` per package and `melos_angel3.iml` at the root, from the root package name `angel3`; they are committed. Renaming the root package makes melos write a new one beside the old.
- **`pubspec.lock` is gitignored**, so the examples resolve to the latest compatible versions.
- The README's TODO lists planned work (OAuth2 and a Flutter app for `auth`, Flutter and web apps for `star_wars` and `yewtube`).
