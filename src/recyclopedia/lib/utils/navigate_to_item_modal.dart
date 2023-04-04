// Define a function that navigates to a new page
import 'package:flutter/material.dart';

import '../screens/item_modal.dart';

void navigateToItemModal(BuildContext context, Map item) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) =>
            ItemModal(item["name"], item["image"], item["description"])),
  );
}
