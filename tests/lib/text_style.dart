import 'package:flutter/material.dart';
import 'my_card.dart';

class Style {
  static final baseTextStyle = const TextStyle(
      fontFamily: 'Poppins'
  );
  static final smallTextStyle = commonTextStyle.copyWith(
    fontSize: 9.0,
    color: Colors.black
  );
  static final commonTextStyle = baseTextStyle.copyWith(
      color: const Color(0xff808080),
      fontSize: 14.0,
      fontWeight: FontWeight.w400
  );
  static final titleTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 18.0,
      fontWeight: FontWeight.w600
  );
  static final headerTextStyle = baseTextStyle.copyWith(
      color: Colors.black,
      fontSize: 20.0,
      fontWeight: FontWeight.w400
  );
}