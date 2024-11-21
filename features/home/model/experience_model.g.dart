// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperienceModelImpl _$$ExperienceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExperienceModelImpl(
      title: json['title'] as String,
      subTitle: json['subTitle'] as String,
      duration: json['duration'] as String,
      description: json['description'] as String,
      responsibilities: (json['responsibilities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ExperienceModelImplToJson(
        _$ExperienceModelImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subTitle': instance.subTitle,
      'duration': instance.duration,
      'description': instance.description,
      'responsibilities': instance.responsibilities,
      'technologies': instance.technologies,
    };
