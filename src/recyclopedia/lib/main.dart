// import 'package:flutter/material.dart';
// import 'package:recyclopedia/map_component/recycle_map_component.dart';
// import 'package:provider/provider.dart';
// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (context) => MapState(),
//     child: const RecycleMapComponent(),
//   ));
// }
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/all.dart';
import 'package:recyclopedia/providers/assets_provider.dart';
import 'package:recyclopedia/providers/category_provider.dart';
// import 'package:recyclopedia/providers/location_provider.dart';
// import 'package:recyclopedia/map_component/recycle_map_component.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MyAppState()),
        ChangeNotifierProvider(create: (context) => ResourcesList()),
        ChangeNotifierProvider(create: (context) => CategoryProvider()),
        ChangeNotifierProvider(create: (context) => AssetsProvider()),
        // ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => MapState())
      ],
      child: MaterialApp(
        title: 'Recyclepedia',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        ),
        home: MainPage(),
      ),
    );
  }
}

// not used
class MyAppState extends ChangeNotifier {
  var current = WordPair.random();

  void getNext() {
    current = WordPair.random();
    notifyListeners();
  }

  var favorites = <WordPair>[];

  void toggleFavorite() {
    if (favorites.contains(current)) {
      favorites.remove(current);
    } else {
      favorites.add(current);
    }
    notifyListeners();
  }
}
