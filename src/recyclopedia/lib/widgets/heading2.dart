import 'package:flutter/material.dart';

class Heading2 extends Text {
  const Heading2(super.data, {super.key});

  @override
  final TextStyle style =
      const TextStyle(fontSize:15, fontWeight: FontWeight.bold);
}
