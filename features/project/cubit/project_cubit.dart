import 'package:boris_ilic_portfolio/core/base/base_async_cubit.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/features/project/model/project_model.dart';
import 'package:boris_ilic_portfolio/repositories/project_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'project_state.dart';
part 'project_cubit.freezed.dart';

@injectable
class ProjectCubit extends BaseAsyncCubit<ProjectState> {
  final ProjectRepository projectRepository;
  ProjectCubit(this.projectRepository) {
    emit(
      const AsyncValue.initial(
        data: ProjectState(),
      ),
    );
  }

  Future<void> getProjectData() async {
    await runguarded(() async {
      List<ProjectModel> projectModelList =
          await projectRepository.getProjectListData();
      return state.data!.copyWith(
        items: projectModelList,
      );
    });
  }
}
