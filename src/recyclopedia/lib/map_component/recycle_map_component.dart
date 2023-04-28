// this file contains everything needed to render the map component

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'place_list.dart';
import 'place_map.dart';
import 'recycle_resource_place.dart'; // RecycleResourcePlace
import "stub_data.dart";
import 'place_details.dart';

enum PlaceTrackerViewType {
  map,
  list;

  static PlaceTrackerViewType fromJson(String json) => values.byName(json);
  String toJson() => name;
}

class RecycleMapComponent extends StatelessWidget {
  const RecycleMapComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green,
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0XFF2F935C),
          foregroundColor: Colors.white,
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color(0XFF2F935C),
          foregroundColor: Colors.white,
        ),
      ),
      // TODO: figure out what I need to do here
      routerConfig: GoRouter(routes: [
        GoRoute(
          path: '/',
          builder: (context, state) => const _PlaceTrackerHomePage(),
          routes: [
            GoRoute(
              path: 'place/:id',
              builder: (context, state) {
                final id = state.params['id']!;
                final place = context
                    .read<MapState>()
                    .places
                    .singleWhere((place) => place.id == id);
                return PlaceDetails(place: place);
              },
            ),
          ],
        ),
      ]),
    );
  }
}

class _PlaceTrackerHomePage extends StatelessWidget {
  const _PlaceTrackerHomePage();

  @override
  Widget build(BuildContext context) {
    var mapState = Provider.of<MapState>(context);
    mapState.initState();
    var viewType = mapState.viewType;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Recycling Bin Locations',
                    style: GoogleFonts.poppins(fontSize: 27.0)),
                // Text('your campus recycling tool',
                //     style: GoogleFonts.poppins(fontSize: 15.0)),
              ]),
            ]),
            const SizedBox(height: 20),
            Row(
              children: <Widget>[
                const Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        filled: true,
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                        prefixIcon: Icon(Icons.search),
                        hintText: 'Search...'),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    viewType == PlaceTrackerViewType.map
                        ? Icons.list
                        : Icons.map,
                    size: 32.0,
                  ),
                  onPressed: () {
                    mapState.setViewType(
                      viewType == PlaceTrackerViewType.map
                          ? PlaceTrackerViewType.list
                          : PlaceTrackerViewType.map,
                    );
                  },
                ),
              ],
            )
          ],
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
        ),
        backgroundColor: const Color(0XFF2F935C),
        toolbarHeight: 210,
      ),
      body: IndexedStack(
        index: viewType == PlaceTrackerViewType.map ? 0 : 1,
        children: const [
          PlaceMap(
              center: LatLng(
                  42.3505, -71.1054)), // BU location 42.3505° N, 71.1054° W
          PlaceList(), // shows place details for the given locations
        ],
      ),
    );
  }
}

class MapState extends ChangeNotifier {
  late List<RecycleResourcePlace> places;
  late PlaceCategory selectedCategory;
  late PlaceTrackerViewType viewType;

  void initState() {
    // places = StubData.places; //TODO:get places from api rather than hard coded
    // selectedCategory = PlaceCategory.binAvailable; // set binAvailable as default
    // viewType = PlaceTrackerViewType.map;

    places = StubData.defaultPlaces
        .map((e) => RecycleResourcePlace.fromJson(e))
        .toList(); //TODO:get places from api rather than hard coded
    selectedCategory = PlaceCategory.fromJson(StubData.defaultCategory);
    viewType = PlaceTrackerViewType.fromJson(StubData.defaultTrackerViewType);
  }

  void setViewType(PlaceTrackerViewType viewType) {
    this.viewType = viewType;
    notifyListeners();
  }

  void setSelectedCategory(PlaceCategory newCategory) {
    selectedCategory = newCategory;
    notifyListeners();
  }

  void setPlaces(List<RecycleResourcePlace> newPlaces) {
    places = newPlaces;
    notifyListeners();
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is MapState &&
        other.places == places &&
        other.selectedCategory == selectedCategory &&
        other.viewType == viewType;
  }

  @override
  int get hashCode => Object.hash(places, selectedCategory, viewType);
}
