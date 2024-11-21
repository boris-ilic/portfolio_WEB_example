part of 'experience_cubit.dart';

@freezed
class ExperienceState with _$ExperienceState {
  const factory ExperienceState({
    @Default([]) List<WorkExperienceModel> workExperienceList,
    @Default([]) List<ExperienceModel> educationExperienceList,
  }) = _ExperienceState;
}
