import 'package:boris_ilic_portfolio/core/base/base_async_cubit.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/features/home/model/experience_model.dart';
import 'package:boris_ilic_portfolio/features/home/model/work_experience_model.dart';
import 'package:boris_ilic_portfolio/repositories/education_repository.dart';
import 'package:boris_ilic_portfolio/repositories/experience_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'experience_state.dart';
part 'experience_cubit.freezed.dart';

@injectable
class ExperienceCubit extends BaseAsyncCubit<ExperienceState> {
  final WorkExperienceRepository experienceRepository;
  final EducationRepository educationRepository;
  ExperienceCubit(this.experienceRepository, this.educationRepository) {
    emit(const AsyncValue.loading(data: ExperienceState()));
  }
  Future<void> getWorkExperienceList() async {
    await runguarded(() async {
      List<WorkExperienceModel> workExperienceList =
          await experienceRepository.getWorkExperienceListData();
      List<ExperienceModel> educationExperienceList =
          await educationRepository.getEducationExperienceListData();
      return state.data!.copyWith(
        workExperienceList: workExperienceList,
        educationExperienceList: educationExperienceList,
      );
    });
  }
}
