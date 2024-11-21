part of 'testimonial_cubit.dart';

@freezed
class TestimonialState with _$TestimonialState {
  const factory TestimonialState({
    @Default([]) List<TestimonialModel> items,
  }) = _TestimonialState;
}
