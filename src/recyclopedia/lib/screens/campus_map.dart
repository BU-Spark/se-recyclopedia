import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/main.dart';

class CampusMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return Center(
      child: Text('No Map yet.'),
    );
  }
}
