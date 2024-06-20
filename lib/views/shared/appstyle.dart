import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

// TextStyle appstyle(double size, FontWeight fw, Color color) {
//   return GoogleFonts.poppins(fontSize: size, fontWeight: fw, color: color);
// }
TextStyle appstyle(double size, FontWeight fw, Color color) {
  return TextStyle(fontSize: size, fontWeight: fw, color: color);
}

TextStyle appstyleWithHt(double size, FontWeight fw, Color color, double h) {
  return TextStyle(fontSize: size, fontWeight: fw, color: color, height: h);
}
