// Define a function that navigates to a new page

import 'package:flutter/material.dart';
import 'package:recyclopedia/models/area_location.dart';
import 'package:recyclopedia/screens/location_modal.dart';


void navigateToLocationModal(BuildContext context, AreaLocation location) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => 
            LocationModal(location.name, location.address, location.image, location.howToFindBins)),
  );
}
