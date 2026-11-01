# AI Context: belatuk-examples

Context for AI coding assistants working in this repository. Read this before making changes.

## What this is

Example applications for the [Angel3 framework](https://angel3-framework.web.app), each showing one kind of app (authentication, a board with an ORM, a Flutter chat over WebSockets, a reverse proxy, video streaming, GraphQL). They are read and copied by developers learning Angel3, so they should work as described in their READMEs and follow good practice.

- Repo: https://github.com/dukefirehawk/belatuk-examples (the README also links `dart-backend/belatuk-examples`)
- Dart SDK: `>=3.13.0 <4.0.0`
- Angel3 packages: `^10.0.0`; GraphQL packages `graphql_server2` ^9, `graphql_schema2` and `graphql_generator2` ^8; `belatuk_pretty_logging` ^7
- A [pub workspace](https://dart.dev/tools/pub/workspaces) managed with melos `^8.10.0`; the melos configuration is in the root `pubspec.yaml` (there is no `melos.yaml`), whose package is `angel3_examples`. The Flutter app `flutter_chat/mobile` is outside the workspace (see Gotchas)

## Examples

| Directory | Workspace package | What it shows | Notes |
|---|---|---|---|
| `auth/backend` | `auth` | Login with `angel3_auth` (local strategy, JWT in a `token` cookie), a page protected for every method, logout | `JWT_SECRET` signs the JWTs (required in production); demo users in `bin/main.dart`; the protected page is in `protected/`, not `web/` |
| `dchan` | `dchan` | Anonymous text/multimedia board: ORM on PostgreSQL, migrations, Jael views | Needs PostgreSQL (`config/default.yaml`, database `dchan_db`); `dart bin/migrate.dart up`; has a `Dockerfile`; runs `PostgreSqlExecutor` over a `Pool` (see Gotchas) |
| `docs_examples/getting_started` | `hello_angel` | The code of the [Getting Started](https://angel3-docs.dukefirehawk.com/guides/getting-started) guide | |
| `flutter_chat/backend` | `backend` | WebSocket chat server (`angel3_websocket`), events `sign_in` and `message` | Invalid data is answered with an error event, not thrown |
| `flutter_chat/common` | `common` | Models shared by the chat's server and app (`angel3_serialize`) | |
| `flutter_chat/mobile` | (outside the workspace) | Flutter chat app (Riverpod 3) | Unfinished: shows the connection state; resolved with `flutter pub get` in its directory |
| `pub_serve_proxy` | `pub_serve_proxy` | Reverse proxy (`angel3_proxy`) to a `build_runner serve` dev server, static files in production | |
| `star_wars/backend` | `star_wars` | GraphQL server (`angel3_graphql`, `graphql_server2`) | |
| `yewtube/backend` | `yewtube` | Video streaming, with a JSON file database (`angel3_file_service`, `db.json`) | |
| `shared/custom_bulma` | (none) | Sass source of a custom Bulma CSS | Not in the workspace; compiled with `compile-sass.dart` |

Each example has a README with how to run it, usually `dart bin/main.dart`, or `bin/dev.dart` and `bin/prod.dart`.

## Development Workflow

- **Setup**: from the root (or any example's directory, which resolves the whole workspace):

  ```bash
  dart pub get
  dart run melos bootstrap
  ```

  All examples share one resolution and the root `pubspec.lock`; an example's own `pubspec.lock` or `.dart_tool/` is deleted by pub. The Flutter app is resolved apart, with `flutter pub get` in `flutter_chat/mobile`.
- **Checks**: run in each example you changed, from its directory (with Flutter's `dart`, or `flutter analyze`/`flutter test`, in `flutter_chat/mobile`):

  ```bash
  dart format --output=none --set-exit-if-changed .
  dart analyze
  ```

  There are almost no tests: only `flutter_chat/mobile/test/widget_test.dart`. Check a server change by running it as its README says, and calling its routes; a passing `dart analyze` does not show that an upgrade works at runtime.
- **Code generation**: after changing a model in `dchan`, `flutter_chat/common`, `star_wars/backend` or `yewtube/backend`, run `dart run build_runner build --delete-conflicting-outputs` in it, and commit the regenerated `*.g.dart`, which are committed so the examples run without it.
- **Adding an example**: add its directory to `workspace:` in the root `pubspec.yaml`, add `resolution: workspace` to its `pubspec.yaml`, and add it to the README's list of examples.
- **CI**: none. Run the checks locally.
- **Changelog**: Every user-facing change gets an entry in the affected package's `CHANGELOG.md`, written as plain-English statements about the package (not commit messages). Group a release's entries under `### Breaking changes in X.Y.Z` (each entry prefixed `**Breaking:**`), `### New in X.Y.Z` and `### Fixes in X.Y.Z`, in that order, omitting empty sections. Prefix each fix with a bold area label, e.g. `* **Services:** An invalid id is a 400`. Commit messages use [Conventional Commits](https://www.conventionalcommits.org/) (`type(scope): description`, `!` for breaking changes).

## Conventions

- The examples teach: comments explain what and why for developers learning Angel3, and link to the Angel3 docs where useful. Prefer the simplest code that shows the feature.
- Dependency constraints are aligned across the examples (e.g. `angel3_*: ^10.0.0`, `lints: ^6.0.0`, `file: ^7.0.1`). An Angel3 upgrade bumps every `angel3_*` dependency, and the matching `belatuk_*`, `graphql_*2` and generator versions, in all examples together.
- Code that is copied into apps should be safe to copy: no secrets in code, no sensitive data in tokens or logs.
- The servers run without a reflector (no `dart:mirrors`), so their `bin/prod.dart` compiles with `dart compile exe`; do not add controllers with `@Expose`, `ioc` or constructor injection without a `StaticReflector` (`angel3_container_generator`).

## Gotchas

- **The Flutter app is outside the workspace**: Flutter's `flutter_test` pins `test_api`, which holds `test` back to a version that needs `analyzer` below 14, while the Angel3 10 code generators (e.g. `graphql_generator2` 8) need `analyzer` 14. In one resolution they cannot be solved. `flutter_chat/mobile` depends on `flutter_chat/common` by path, which works from outside the workspace.
- **`dchan` runs `PostgreSqlExecutor` over a `Pool`**: `PostgreSqlPoolExecutor` of `angel3_orm_postgres` 10.0.1 adds a `RETURNING` clause to inserts that already have one, and fails with `syntax error at or near "RETURNING"` (fixed in 10.0.2 of `belatuk`). `PostgreSqlExecutor` takes any `Session`, a `Pool` too.
- **`flutter_chat`'s `Message` model requires a `user`**, though the backend replaces it with the signed-in user: a client must send one.
- **Shared resolution**: as the examples resolve together, a dependency one of them needs at a new major version may conflict with another; upgrade them together.
- **IntelliJ files**: melos generates a `melos_<name>.iml` per package, and one at the root named after the root package, `melos_angel3_examples.iml`. Renaming the root package makes melos write a new one beside the old (`melos_angel3.iml` is of its former name, `angel3`).
- **`pubspec.lock` is gitignored**, so the examples resolve to the latest compatible versions.
- The README's TODO lists planned work (OAuth2 and a Flutter app for `auth`, Flutter and web apps for `star_wars` and `yewtube`, finishing the `flutter_chat` app).
