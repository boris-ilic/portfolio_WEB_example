// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AboutDetailModelImpl _$$AboutDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AboutDetailModelImpl(
      aboutService: json['aboutService'] as String? ?? "",
      services: (json['services'] as List<dynamic>?)
              ?.map((e) => ServiceModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$AboutDetailModelImplToJson(
        _$AboutDetailModelImpl instance) =>
    <String, dynamic>{
      'aboutService': instance.aboutService,
      'services': instance.services,
    };

_$ServiceModelImpl _$$ServiceModelImplFromJson(Map<String, dynamic> json) =>
    _$ServiceModelImpl(
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
    );

Map<String, dynamic> _$$ServiceModelImplToJson(_$ServiceModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
