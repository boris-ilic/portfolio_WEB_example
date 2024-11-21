import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_experience_model.freezed.dart';
part 'work_experience_model.g.dart';

@freezed
class WorkExperienceModel with _$WorkExperienceModel {
  const factory WorkExperienceModel({
    required String companyName,
    required String role,
    required String duration,
    required String projectType,
    required int teamSize,
    required String projectArea,
    required String description,
    required List<String> technologies,
    String? visitAppLink,
  }) = _WorkExperienceModel;

  factory WorkExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$WorkExperienceModelFromJson(json);
}
