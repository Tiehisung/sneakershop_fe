String capitalizeEveryWord(String text) {
  if (text.isEmpty) return text;
  final list=text.split(" ").map((word)=>capitalizeFirstLetter(word)).toList();
  return list.join(" ");
}
String capitalizeFirstLetter(String text) {
  if (text.isEmpty) return text;
  return text[0].toUpperCase() + text.substring(1);
}
