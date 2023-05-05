import 'package:flutter/material.dart';

class AssetsProvider extends ChangeNotifier {
  Image appLogo = const Image(
  image: ExactAssetImage("/recyclepedia_logo.jpg"),
  height: 75.0,
  width: 75.0,
);
}