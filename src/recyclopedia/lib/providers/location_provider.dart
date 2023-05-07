import 'package:flutter/material.dart';
import 'package:recyclopedia/global_configuration.dart';
import 'package:recyclopedia/models/area_location.dart';

/// Provide locations to the map component, currently unused.
@deprecated("Non of the components should be using this, use /map_component/place_details.dart instead")
class LocationProvider extends ChangeNotifier {
  late List<Map<String, dynamic>> locations;
  late List<AreaLocation> allLocations;

  LocationProvider() {
    List<Map<String, dynamic>> locations = defaultLocations;
    // print(locations);
    allLocations = locations.map((json) {
      // print(json);
      return AreaLocation.fromJson(json);
    },).toList();
  }
  void methodThatDoesNothing() {
    notifyListeners();
  }
}
