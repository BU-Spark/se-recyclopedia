// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycle_resource_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecycleResourcePlace _$RecycleResourcePlaceFromJson(
        Map<String, dynamic> json) =>
    RecycleResourcePlace(
      id: json['id'] as String,
      latLng: LatLngJson.fromJson(json['latLng'] as Map<String, dynamic>),
      name: json['name'] as String,
      category: $enumDecode(_$PlaceCategoryEnumMap, json['category']),
      description: json['description'] as String?,
      direction: json['direction'] as String,
      building: json['building'] as String?,
      address: json['address'] as String,
    );

Map<String, dynamic> _$RecycleResourcePlaceToJson(
        RecycleResourcePlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latLng': instance.latLng,
      'name': instance.name,
      'category': _$PlaceCategoryEnumMap[instance.category]!,
      'description': instance.description,
      'direction': instance.direction,
      'building': instance.building,
      'address': instance.address,
    };

const _$PlaceCategoryEnumMap = {
  PlaceCategory.recycleTrashBin: 'recycleTrashBin',
  PlaceCategory.recycleBox: 'recycleBox',
  PlaceCategory.informationCenter: 'informationCenter',
};
