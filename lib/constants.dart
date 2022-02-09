// ignore_for_file: non_constant_identifier_names

import 'dart:ui';
import 'package:flutter/material.dart';

// --------------All color palettes are here --------------
// --------------------------------------------------------
Color scaffold_color = Color(0xffF6F6F6);
Color sub_heading_color = Color.fromRGBO(50, 17, 83, 0.6);
Color text_field_color = Color(0xff822FAF);

// ---------------- Gradients -----------------------------
// --------------------------------------------------------
final Shader headingGradient = const LinearGradient(colors: [
  Color(0xffD55D92),
  Color(0xffea698b),
  Color(0xff822faf),
  Color(0xffea698b),
  Color(0xffD55D92)
]).createShader(
  const Rect.fromLTWH(0.0, 0.0, 450.0, 70.0),
);

dynamic button_gradient = const LinearGradient(colors: [
  Color(0xffea698b),
  Color(0xff822faf),
]);

// -------------- Fonts -----------------------------------
// --------------------------------------------------------
String FontFamily_main = 'Nunito';

// -------------------- TextStyles---------------------------
// ----------------------------------------------------------
TextStyle form_heading = TextStyle(
  fontFamily: FontFamily_main,
  fontWeight: FontWeight.normal,
  fontSize: 15,
  color: const Color(0xff949494),
);
