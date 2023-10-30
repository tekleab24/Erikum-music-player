import 'package:erikum_music_player/constants/colors.dart';
import 'package:flutter/material.dart';

const roboto = "Robot";
myTextStyle(
    {family = 'Roboto',
    double? size = 18,
    color = whiteColor,
    double? weight = 700}) {
  return TextStyle(fontSize: size, color: color, fontFamily: family);
}
