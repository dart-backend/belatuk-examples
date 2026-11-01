# Belatuk Examples

[![Logo](./logo3.png)](https://github.com/dukefirehawk/angel3-examples)

![Pub Version (including pre-releases)](https://img.shields.io/pub/v/angel3_framework?include_prereleases)
[![Null Safety](https://img.shields.io/badge/null-safety-brightgreen)](https://dart.dev/null-safety)
[![Gitter](https://img.shields.io/gitter/room/nwjs/nw.js.svg)](https://gitter.im/angel_dart/discussion)
[![License](https://img.shields.io/github/license/dukefirehawk/graphql_dart)](https://github.com/dukefirehawk/angel3-examples/LICENSE)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)

A collection of thoroughly-commented example projects build with Angel3 framework.

## Setup

The examples use Angel3 10 and Dart 3.13 or later. They are a [pub workspace](https://dart.dev/tools/pub/workspaces), managed with [melos](https://melos.invertase.dev) 8, whose configuration is in the root `pubspec.yaml`, and are resolved together:

```bash
dart pub get
dart run melos bootstrap
```

`dart pub get` in an example's directory resolves the whole workspace too.

The Flutter app of `flutter_chat` (`flutter_chat/mobile`) is not in the workspace, as Flutter pins versions of test packages that the Angel3 10 code generators cannot use. Resolve it on its own:

```bash
cd flutter_chat/mobile
flutter pub get
```

## Getting Started

The source code for [`Getting Started`](https://angel3-docs.dukefirehawk.com/guides/getting-started) in Angel3

## Examples

### [Simple Authentication](https://github.com/dart-backend/belatuk-examples/tree/master/auth)

A simple user authentication application, storing a token in a `token` cookie, in Angel3.

### [Multimedia Board](https://github.com/dart-backend/belatuk-examples/tree/master/dchan)

A simple, anonymous text/multimedia board application in Angel3.

### [Flutter Chat](https://github.com/dart-backend/belatuk-examples/tree/master/flutter_chat)

A simple Flutter chatting application with backend in Angel3.

### [Reverse Proxy](https://github.com/dart-backend/belatuk-examples/tree/master/pub_serve_proxy)

An example of reverse proxy application in Angel3

### [Video Streaming](https://github.com/dart-backend/belatuk-examples/tree/master/yewtube)

An example of video stream application in Angel3

### [Star Wars](https://github.com/dart-backend/belatuk-examples/tree/master/star_wars)

An example of graphQL application in Angel3

## TODO

* Update `auth`
  * Apply `Bulma` or `Bootstrap` layout
  * Add `OAuth2` authentication with Google, Facebook and Twitter
  * Add flutter mobile app
* Update `flutter_chat`
  * Change flutter mobile app state management to `package:riverpod`
* Update `star_wars` app
  * Add flutter mobile app
  * Add web app
* Update `yewtube`
  * Add flutter mobile app
  