/// The recycle_map_component.dart file is the main container of the map component, 
/// it is responsible for the main layout and initiate the `MapState` class.
/// The `MapState` class is the most important part in this file, it allows the 
/// whole project to listen to the change within MapState then make modifications to the outcome 
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
  /// This stateless widget renders the place tracker's root directory, which 
  /// would display the map component by default
  const _PlaceTrackerHomePage();

  @override
  Widget build(BuildContext context) {
    var mapState = Provider.of<MapState>(context);
    var viewType = mapState.viewType;
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text('Recycling Bin Locations',
                    style: GoogleFonts.poppins(fontSize: 27.0)),
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

  MapState() {
    /// We initiate MapState with the fromJson method because it give protential
    /// upgrade functionality if admin want to change what people could see from the page
    places = StubData.defaultPlaces
        .map((e) => RecycleResourcePlace.fromJson(e))
        .toList();
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
