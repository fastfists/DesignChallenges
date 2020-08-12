import 'package:flutter/material.dart';

final kbackgroundGradient =  RadialGradient(
  center: Alignment.centerRight,
  radius: 1,
  colors: [
    const Color(0xFFE5E5E5),
    const Color.fromRGBO(103, 135, 163, 0.82),
    const Color(0xFF6787A3),
  ],
  stops: [0.0, 0.514, 0.9653],
);

final kbackgroundColor = Color(0xFF6787A3);
