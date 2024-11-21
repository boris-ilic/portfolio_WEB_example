part of 'project_cubit.dart';

@freezed
class ProjectState with _$ProjectState {
  const factory ProjectState({
    @Default([]) List<ProjectModel> items,
  }) = _ProjectState;
}
