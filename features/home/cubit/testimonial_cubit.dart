import 'package:boris_ilic_portfolio/core/base/base_async_cubit.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/features/home/model/testimonial_model.dart';
import 'package:boris_ilic_portfolio/repositories/testimonial_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'testimonial_state.dart';
part 'testimonial_cubit.freezed.dart';

@injectable
class TestimonialCubit extends BaseAsyncCubit<TestimonialState> {
  final TestimonialRepository testimonialRepository;
  TestimonialCubit(this.testimonialRepository) {
    emit(
      const AsyncValue.initial(
        data: TestimonialState(),
      ),
    );
  }

  Future<void> getTestimonialData() async {
    await runguarded(() async {
      List<TestimonialModel> testimonialModelList =
          await testimonialRepository.getTestimonialListData();
      return state.data!.copyWith(
        items: testimonialModelList,
      );
    });
  }
}
