import 'package:flutter/material.dart';

class AssetsProvider extends ChangeNotifier {
  Image appLogo = const Image(
  image: ExactAssetImage("images/logo.jpg"),
  height: 75.0,
  width: 75.0,
);
}