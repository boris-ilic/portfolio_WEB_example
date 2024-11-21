// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProjectModelImpl _$$ProjectModelImplFromJson(Map<String, dynamic> json) =>
    _$ProjectModelImpl(
      title: json['title'] as String? ?? "",
      description: json['description'] as String? ?? "",
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      imageUrl: json['imageUrl'] as String? ?? "",
      url: json['url'] as String? ?? "",
      projectCategory: json['projectCategory'] as String? ?? "",
      projectClient: json['projectClient'] as String? ?? "",
      projectDuration: json['projectDuration'] as String? ?? "",
      country: json['country'] as String? ?? "",
    );

Map<String, dynamic> _$$ProjectModelImplToJson(_$ProjectModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'categories': instance.categories,
      'imageUrl': instance.imageUrl,
      'url': instance.url,
      'projectCategory': instance.projectCategory,
      'projectClient': instance.projectClient,
      'projectDuration': instance.projectDuration,
      'country': instance.country,
    };
