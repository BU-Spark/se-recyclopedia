import 'package:flutter/material.dart';
import 'package:recyclopedia/map_component/recycle_map_component.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MapState(),
    child: const RecycleMapComponent(),
  ));
}
