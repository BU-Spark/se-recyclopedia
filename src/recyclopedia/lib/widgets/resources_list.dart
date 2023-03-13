import 'package:flutter/material.dart';
import 'package:recyclopedia/models/all.dart';

class ResourcesList extends ChangeNotifier {
  var articles = <ResourceArticle>[];

  void updateResource() {
    // fetch resource list
    notifyListeners();
  }
}
