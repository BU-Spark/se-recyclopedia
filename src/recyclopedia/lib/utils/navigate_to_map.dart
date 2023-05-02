// Define a function that navigates to a new page

import 'package:flutter/material.dart';
import 'package:recyclopedia/map_component/recycle_map_component.dart';
import 'package:recyclopedia/models/area_location.dart';
import 'package:recyclopedia/screens/location_modal.dart';


void navigateToMap(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => RecycleMapComponent()),
            // LocationModal(location.name, location.address, location.image, location.howToFindBins)),
  );
}
