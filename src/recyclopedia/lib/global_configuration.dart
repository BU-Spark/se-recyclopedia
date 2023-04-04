import 'package:flutter/material.dart';

String defaultItemModalImage = "images/paper.jpg";

Image appLogo = const Image(
  image: ExactAssetImage("images/logo.jpg"),
  height: 75.0,
  width: 75.0,
);

// List popularCategoryList = [
//   {"image": "images/paper.jpg", "name": "Paper Bags"},
//   {"image": "images/paper1.jpg", "name": "Plastic Cups"},
//   {"image": "images/paper2.jpg", "name": "Boxes"},
//   {"image": "images/paper3.jpg", "name": "Batteries"}
// ];

List popularCategoryList = categoryList
    .where((x) =>
        ["Paper", "Cans", "Boxes", "Batteries"].contains(x["name"]))
    .toList();

List categoryList = [
  {
    "image": "images/Chopsticks.png",
    "name": "Chopsticks",
    "description": [
      "Put this item in your trash bin."
    ]
  },
  {
    "image": "images/Aluminum.png",
    "name": "Aluminum containers",
    "description": [
      "Rinse or wipe clean all food or other residue.",
      "Put this item in your trash bin."
    ]
  },
  {
    "image": "images/Batteries.png",
    "name": "Batteries",
    "description": [
      "Lithium Batteries: Hold for a local household hazardous waste collection day. Call your local Recycling Center or City/Town Hall for more information."
    ]
  },
  {
    "image": "images/Balloons.png",
    "name": "Balloons",
    "description": [
      "Put this item in your trash bin."
    ]
  },
  {
    "image": "images/BerryBaskets.png",
    "name": "Berry baskets",
    "description": [
      "Put this item in your trash bin."
    ]
  },
  {
    "image": "images/Boxes.png",
    "name": "Boxes",
    "description": [
      "Put this item in your trash bin."
    ]
  },
  {
    "image": "images/PaperCups.png",
    "name": "Paper cups",
    "description": [
      "Put this item in your trash bin."
    ]
  },
  {
    "image": "images/Cardboard.png",
    "name": "Cardboard",
    "description": [
      "Flatten/nest when possible. Remove all foam, bubble wrap, air pillows.",
      "Remove as much tape as you can but, generally speaking, tape is okay."
    ]
  },
  {
    "image": "images/Paper.jpg",
    "name": "Paper",
    "description": ["Staples and paper clips are okay."]
  },
  {
    "image": "images/FoodBox.png",
    "name": "Food boxes",
    "description": ["Remove all liners."]
  },
  {
    "image": "images/Mail.png",
    "name": "Mail",
    "description": ["Remove free samples."]
  },
  {
    "image": "images/Cans.png",
    "name": "Cans",
    "description": ["Empty and rinse."]
  },
  {
    "image": "images/FoodCans.png",
    "name": "Food cans",
    "description": ["Rinse or wipe clean all food/residue. Replace lid."]
  },
  {
    "image": "images/GlassBottle.png",
    "name": "Glass bottle",
    "description": ["Rinse or wipe clean all food/residue."]
  },
  {
    "image": "images/Jars.png",
    "name": "Jars (glass and plastic)",
    "description": [
      "Rinse or wipe clean all food/residue. Replace lid.",
      "There is NO need to remove label."
    ]
  },
  {
    "image": "images/Jug.png",
    "name": "Jugs",
    "description": ["Rinse or wipe clean all food/residue. Replace lid."]
  },
  {
    "image": "images/PlasticBottle.png",
    "name": "Plastic bottles and caps",
    "description": [
      "Empty and replace cap.",
      "There is a five cent deposit on carbonated soft drink, beer, malt beverage, and sparkling water containers sold in Massachusetts. Items that meet that description",
      "can be returned for a \$0.05 deposit at a local grocery store or redemption center. Find a redemption center near you.",
      "Or, you can put in your recycling bin.",
      "We have recently gotten questions about whether the plastic sleeves on plastic bottles should be removed and we are updating our response.  For labels that are clearly asking to be removed, the answer is YES, remove them.  These labels can impact the recyclability of plastic containers because during the sorting process the labels can mask the type of plastic resin the bottle is made from, which may result in the bottles being missorted and/or not being recycled.",
      "Normally, labels on plastic containers aren’t problematic and can simply remain on the bottle, jar, jug or tub.  Most labels are either recycled with the container if it’s the same resin or handled by the reclaimer.  So, if you see a bottle, jar, jug or tub with a label that asks you to remove it, please do!"
    ]
  },
];
