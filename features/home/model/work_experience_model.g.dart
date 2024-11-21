// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_experience_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WorkExperienceModelImpl _$$WorkExperienceModelImplFromJson(
        Map<String, dynamic> json) =>
    _$WorkExperienceModelImpl(
      companyName: json['companyName'] as String,
      role: json['role'] as String,
      duration: json['duration'] as String,
      projectType: json['projectType'] as String,
      teamSize: (json['teamSize'] as num).toInt(),
      projectArea: json['projectArea'] as String,
      description: json['description'] as String,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      visitAppLink: json['visitAppLink'] as String?,
    );

Map<String, dynamic> _$$WorkExperienceModelImplToJson(
        _$WorkExperienceModelImpl instance) =>
    <String, dynamic>{
      'companyName': instance.companyName,
      'role': instance.role,
      'duration': instance.duration,
      'projectType': instance.projectType,
      'teamSize': instance.teamSize,
      'projectArea': instance.projectArea,
      'description': instance.description,
      'technologies': instance.technologies,
      'visitAppLink': instance.visitAppLink,
    };
