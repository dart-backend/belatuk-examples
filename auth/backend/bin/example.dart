void main() async {
  final myString = '25F8AA..25FF    ; Common # Sm   [8] UPPER LEFT TRIANGLE';
// find a variable length hex value at the beginning of the line
  final regexp = RegExp(r'^[0-9a-fA-F]+');
// find the first match though you could also do `allMatches`
  final match = regexp.firstMatch(myString);
//
  String? word = match?.group(0);

  print("Match: $word");
// if your regex had groups (using parenthese
}
