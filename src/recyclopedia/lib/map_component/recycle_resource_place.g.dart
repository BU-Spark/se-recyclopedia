// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recycle_resource_place.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecycleResourcePlace _$RecycleResourcePlaceFromJson(
        Map<String, dynamic> json) =>
    RecycleResourcePlace(
      id: json['id'] as String,
      latLng: json['latLng'],
      name: json['name'] as String,
      category: $enumDecode(_$PlaceCategoryEnumMap, json['category']),
      description: json['description'] as String,
      directions: json['directions'] as List,
      building: json['building'] as String?,
      address: json['address'] as String,
      image: json['image'] as String,
      bins: json['bins'] as List,
    );

Map<String, dynamic> _$RecycleResourcePlaceToJson(
        RecycleResourcePlace instance) =>
    <String, dynamic>{
      'id': instance.id,
      'latLng': instance.latLng,
      'name': instance.name,
      'category': instance.category,
      'description': instance.description,
      'directions': instance.directions,
      'building': instance.building,
      'address': instance.address,
      'image': instance.image,
      'bins': instance.bins,
    };

const _$PlaceCategoryEnumMap = {
  PlaceCategory.binAvailable: 'binAvailable',
  PlaceCategory.binUnavailable: 'binUnavailable',
};
