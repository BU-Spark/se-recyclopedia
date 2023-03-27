import 'package:flutter/material.dart';

class Heading1 extends Text {
  const Heading1(super.data, {super.key});

  @override
  final TextStyle style =
      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, );
      
  @override
  final TextAlign align = TextAlign.left;
}
