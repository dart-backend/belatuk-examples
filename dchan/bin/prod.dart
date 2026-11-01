import 'package:angel3_production/angel3_production.dart';
import 'package:dchan/dchan.dart';

// The application runs without a reflector, so it needs no `dart:mirrors`, and
// can be compiled with `dart compile exe`.
//
// These features need a reflector:
// * Controllers, via @Expose() or @ExposeWs()
// * Dependency injection into constructors, in controllers or `container.make`
// * The `ioc` function, in a route without an explicit `injection:`
// * @Hooks() and @Middleware() annotations
//
// To use them, pass a `reflector:` to the `Runner`:
// * a `StaticReflector` of the data that `package:angel3_container_generator`
//   generates, which can be compiled with `dart compile exe`; or
// * the `MirrorsReflector` of `package:angel3_container_mirrors`, which needs
//   the Dart VM, as `dart run`.
void main(List<String> args) => Runner('dchan', configureServer).run(args);
