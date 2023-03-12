
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LogoHeader extends StatelessWidget {
  const LogoHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      flexibleSpace: Row(children: [
        Icon(Icons.abc),
        Column(children: [
          Text('Flutter'),
          Text('description')
        ],)
      ],),
    );
  }
}

