import 'dart:io';

import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  //final Image imgUrl;
  final String imgUrl, title, desc, postUrl;

  const NewsCard({
    Key? key,
    required this.imgUrl,
    required this.desc,
    required this.title,
    required this.postUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.asset(
                imgUrl,
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                errorBuilder: (BuildContext context, Object exceotion,
                    StackTrace? stackTrace) {
                  return Card(
                    shape: RoundedRectangleBorder(
                        side: BorderSide(color: Color(0XFF2F935C), width: 5),
                        borderRadius: BorderRadius.circular(10)),
                    child: const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Icon(Icons.broken_image_outlined),
                    ),
                  );
                },
              )),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              title,
              maxLines: 2,
              style: const TextStyle(
                  color: Colors.black87,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(6),
            child: Text(
              desc,
              maxLines: 2,
              style: const TextStyle(color: Colors.black54, fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}
