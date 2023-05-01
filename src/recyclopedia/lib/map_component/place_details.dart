// Copyright 2020 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:recyclopedia/widgets/all.dart';

import 'package:recyclopedia/map_component/recycle_resource_place.dart';
import 'package:recyclopedia/map_component/recycle_map_component.dart';
import 'stub_data.dart';

class PlaceDetails extends StatefulWidget {
  final RecycleResourcePlace place;

  const PlaceDetails({
    required this.place,
    super.key,
  });

  @override
  State<PlaceDetails> createState() => _PlaceDetailsState();
}

class _PlaceDetailsState extends State<PlaceDetails> {
  late RecycleResourcePlace _place;
  late String selectedBin;
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(_place.name),
    //     backgroundColor: Colors.green[700],
    //     actions: [
    //       Padding(
    //         padding: const EdgeInsets.fromLTRB(0.0, 0.0, 8.0, 0.0),
    //         child: IconButton(
    //           icon: const Icon(Icons.save, size: 30.0),
    //           onPressed: () {
    //             _onChanged(_place);
    //             Navigator.pop(context);
    //           },
    //         ),
    //       ),
    //     ],
    //   ),
    //   body: GestureDetector(
    //     onTap: () {
    //       FocusScope.of(context).requestFocus(FocusNode());
    //     },
    //     child: _detailsBody(),
    //   ),
    // );
    return Scaffold(
        appBar: AppBar(
          title: Text(_place.name),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Heading1(_place.name)),
              Text(_place.address,
                  style: GoogleFonts.poppins(
                      fontSize: 18.0, fontWeight: FontWeight.normal)),
              ItemPreview({"image": _place.image}),
              Expanded(
                // height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  // Let the ListView know how many items it needs to build.
                  itemCount: _place.bins.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    // final item = bins[index];
                    // return Text("gesture");
                    return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedBin = _place.bins[index];
                          });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(color: Colors.green),
                            ),
                          ),
                          child: Text(
                            _place.bins[index],
                            style: const TextStyle(fontSize: 20),
                          ),
                        ));
                  },
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  // Let the ListView know how many items it needs to build.
                  itemCount: _place.directions.length,
                  // Provide a builder function. This is where the magic happens.
                  // Convert each item into a widget based on the type of item it is.
                  itemBuilder: (context, index) {
                    return ListTile(
                        leading: CircleAvatar(child: Text(index.toString())),
                        title: Text(_place.directions[index]));
                  },
                ),
              ),
            ],
          ),
        ),
      );
  
  }

  @override
  void initState() {
    _place = widget.place;
    _nameController.text = _place.name;
    _descriptionController.text = _place.description;
    return super.initState();
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_place.latLng.toString()),
        position: _place.latLng,
      ));
    });
  }

  void _onChanged(RecycleResourcePlace value) {
    // Replace the place with the modified version.
    final newPlaces = List<RecycleResourcePlace>.from(context.read<MapState>().places);
    final index = newPlaces.indexWhere((place) => place.id == value.id);
    newPlaces[index] = value;

    context.read<MapState>().setPlaces(newPlaces);
  }
}


class _Map extends StatelessWidget {
  final LatLng center;

  final GoogleMapController? mapController;
  final ArgumentCallback<GoogleMapController> onMapCreated;
  final Set<Marker> markers;

  const _Map({
    required this.center,
    required this.mapController,
    required this.onMapCreated,
    required this.markers,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      elevation: 4,
      child: SizedBox(
        width: 340,
        height: 240,
        child: GoogleMap(
          onMapCreated: onMapCreated,
          initialCameraPosition: CameraPosition(
            target: center,
            zoom: 16,
          ),
          markers: markers,
          zoomGesturesEnabled: false,
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,
          scrollGesturesEnabled: false,
        ),
      ),
    );
  }
}

