// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'testimonial_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TestimonialModelImpl _$$TestimonialModelImplFromJson(
        Map<String, dynamic> json) =>
    _$TestimonialModelImpl(
      displayName: json['displayName'] as String? ?? "",
      avatar: json['avatar'] as String? ?? "",
      position: json['position'] as String? ?? "",
      recommendation: json['recommendation'] as String? ?? "",
    );

Map<String, dynamic> _$$TestimonialModelImplToJson(
        _$TestimonialModelImpl instance) =>
    <String, dynamic>{
      'displayName': instance.displayName,
      'avatar': instance.avatar,
      'position': instance.position,
      'recommendation': instance.recommendation,
    };
