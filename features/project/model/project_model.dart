import 'package:freezed_annotation/freezed_annotation.dart';

part 'project_model.freezed.dart';
part 'project_model.g.dart';

@freezed
class ProjectModel with _$ProjectModel {
  const factory ProjectModel({
    @Default("") String title,
    @Default("") String description,
    @Default([]) List<String> categories,
    @Default("") String imageUrl,
    @Default("") String url,
    @Default("") String projectCategory,
    @Default("") String projectClient,
    @Default("") String projectDuration,
    @Default("") String country,
  }) = _ProjectModel;

  factory ProjectModel.fromJson(Map<String, Object?> json) =>
      _$ProjectModelFromJson(json);
}
