import 'package:boris_ilic_portfolio/core/base/base_async_cubit.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/features/about/model/about_detail_model.dart';
import 'package:boris_ilic_portfolio/repositories/about_section_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'about_detail_state.dart';
part 'about_detail_cubit.freezed.dart';

@injectable
class AboutDetailCubit extends BaseAsyncCubit<AboutDetailState> {
  final AboutSectionRepository aboutSectionRepository;
  AboutDetailCubit(this.aboutSectionRepository) {
    emit(
      const AsyncValue.initial(
        data: AboutDetailState(),
      ),
    );
  }

  Future<void> getAboutData() async {
    await runguarded(() async {
      AboutDetailModel aboutDetailModel =
          await aboutSectionRepository.getAboutData();
      return state.data!.copyWith(
        aboutDetailModel: aboutDetailModel,
      );
    });
  }
}
