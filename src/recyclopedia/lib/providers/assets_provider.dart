import 'package:flutter/material.dart';
import 'package:recyclopedia/global_configuration.dart';

class AssetsProvider extends ChangeNotifier {
  Image appLogo = Image(
  image: ExactAssetImage(appLogoPath),
  height: 75.0,
  width: 75.0,
);
}