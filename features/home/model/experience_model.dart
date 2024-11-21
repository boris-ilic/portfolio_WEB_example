import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience_model.freezed.dart';
part 'experience_model.g.dart';

@freezed
class ExperienceModel with _$ExperienceModel {
  const factory ExperienceModel({
    required String title,
    required String subTitle,
    required String duration,
    required String description,
    required List<String> responsibilities,
    required List<String> technologies,
  }) = _ExperienceModel;

  factory ExperienceModel.fromJson(Map<String, dynamic> json) =>
      _$ExperienceModelFromJson(json);
}
