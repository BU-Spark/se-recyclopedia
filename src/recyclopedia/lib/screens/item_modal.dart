import 'package:flutter/material.dart';
import 'package:recyclopedia/widgets/heading1.dart';

class ItemModal extends StatelessWidget {
  final String data;

  const ItemModal(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Heading1(data),
        Container(),
        Container(),
        Container(),
        Container(),
        Container()
      ],
    );
  }
}