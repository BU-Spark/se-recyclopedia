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
  final String description; // this ? means that description can be null value
  final List
      directions; // no ? means that this field must be something else than null
  final String? building;
  final String address;
  final List bins;
  final String image; 

  RecycleResourcePlace({
    required this.id,
    required latLng,
    required this.name,
    required this.category,
    required this.description,
    required this.directions,
    this.building,
    required this.address,
    required this.bins,
    required this.image,
  }) : latLng = latLng.runtimeType == LatLngJson
            ? latLng
            : latLng.runtimeType == LatLng
                ? LatLngJson.fromLatLng(latLng)
                : LatLngJson.fromJson(latLng);

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
    List<String>? directions,
    String? building,
    String? address,
    List<String>?  bins,
    String? image, 
  }) {
    return RecycleResourcePlace(
      id: id ?? this.id,
      latLng: latLng ?? this.latLng,
      name: name ?? this.name,
      category: category ?? this.category,
      description: description ?? this.description,
      directions: directions ?? this.directions,
      building: building ?? this.building,
      address: address ?? this.address,
      bins: bins ?? this.bins,
      image: image ?? this.image,
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
          address == other.address &&
          bins == other.bins && 
          image == other.image;
  // description and direction don't have to be the same

  @override
  int get hashCode =>
      id.hashCode ^
      latLng.hashCode ^
      name.hashCode ^
      category.hashCode ^
      description.hashCode ^
      directions.hashCode ^
      building.hashCode ^
      address.hashCode ^
      bins.hashCode ^ 
      image.hashCode;
}

// https://pub.dev/packages/json_serializable#enums
@JsonEnum()
enum PlaceCategory {
  // Shows the category of the marker on the map, could be one of the several kinds
  // TODO: need to discuss with client for how many kinds of resources there are -> change color or marker on map accordingly
  // recycleTrashBin,
  // recycleBox,
  // informationCenter,
  @JsonValue("binAvailable")
  binAvailable,
  @JsonValue("binUnavailable")
  binUnavailable;

  static PlaceCategory fromJson(String json) => values.byName(json);
  String toJson() => name;
}
