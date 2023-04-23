// This file contains the information about class recycle_resource_place

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recyclopedia/map_component/latlngJson.dart';

part 'recycle_resource_place.g.dart';

// @ https://pub.dev/packages/json_serializable
@JsonSerializable()
class RecycleResourcePlace {
  final String id;

  final LatLngJson latLng;
  // add ...as LatLngJson to places where argument_type_not_assignable error occurs.
  // or (the current solution) change RecycleResourcePlace constructor. 

  // final LatLng latLng;
  // not supported by json_serializable.
  // Either change to simpler types suggested in json_serializable's documentation,
  // or add ...as LatLngJson to places where argument_type_not_assignable error occurs.
  // or (the current solution) change RecycleResourcePlace constructor.

  final String name;
  final PlaceCategory category;
  final String? description; // this ? means that description can be null value
  final String
      direction; // no ? means that this field must be something else than null
  final String? building;
  final String address;

  RecycleResourcePlace({
    required this.id,
    required latLng,
    required this.name,
    required this.category,
    this.description,
    required this.direction,
    this.building,
    required this.address,
  }) : latLng = LatLngJson.fromLatLng(latLng);

  /// Connect the generated [_$RecycleResourcePlaceFromJson] function to the `fromJson`
  /// factory.
  factory RecycleResourcePlace.fromJson(Map<String, dynamic> json) =>
      _$RecycleResourcePlaceFromJson(json);

  /// Connect the generated [_$RecycleResourcePlaceToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$RecycleResourcePlaceToJson(this);

  double get latitude => latLng.latitude;

  double get longitude => latLng.longitude;

  String get addressOf => address; // what does this do?

  RecycleResourcePlace copyWith({
    String? id,
    LatLng? latLng,
    String? name,
    PlaceCategory? category,
    String? description,
    String? direction,
    String? building,
    String? address,
  }) {
    return RecycleResourcePlace(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      direction: direction ?? this.direction,
      building: building ?? this.building,
      address: address ?? this.address,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecycleResourcePlace &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          latLng == other.latLng &&
          name == other.name &&
          category == other.category &&
          building == other.building &&
          address == other.address;
  // description and direction don't have to be the same

  @override
  int get hashCode =>
      id.hashCode ^
      latLng.hashCode ^
      name.hashCode ^
      category.hashCode ^
      description.hashCode ^
      direction.hashCode ^
      building.hashCode ^
      address.hashCode;
}

enum PlaceCategory {
  // Shows the category of the marker on the map, could be one of the several kinds
  // TODO: need to discuss with client for how many kinds of resources there are -> change color or marker on map accordingly
  recycleTrashBin,
  recycleBox,
  informationCenter,
}
