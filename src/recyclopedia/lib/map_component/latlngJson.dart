/// This file extends the recycle_resource_place class and add the functionality of parsing json formatted data from APIs to the format we need.

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'latlngJson.g.dart';

@JsonSerializable()
class LatLngJson extends LatLng {
  const LatLngJson(super.latitude, super.longitude);
  factory LatLngJson.fromLatLng(LatLng latLng) => LatLngJson(latLng.latitude,latLng.longitude);
  factory LatLngJson.fromJson(Map<String, dynamic> json) =>
      _$LatLngJsonFromJson(json);
  @override
  Map<String, dynamic> toJson() => _$LatLngJsonToJson(this);
}
