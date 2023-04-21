import 'package:flutter/material.dart';

class ItemPreview extends Container {
  final Map item;

  ItemPreview(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Color(0XFF4B905F),
              offset: Offset(4, 4),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            )
          ],
          border: Border.all(color: const Color(0XFF4B905F), width: 3)),
      child: Column(
        children: [
          Container(
              child: Image.asset(
            // defaultItemModalImage,
            item["image"],
            fit: BoxFit.contain,
          )),
          Text(
            item["name"],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
