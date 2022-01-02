import 'dart:io';
import 'package:sass/sass.dart' as sass;

void main(List<String> arguments) {
  var result =
      sass.compileToResult(arguments[0], style: sass.OutputStyle.compressed);
  new File(arguments[1]).writeAsStringSync(result.css);
}
