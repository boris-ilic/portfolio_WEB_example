import 'package:freezed_annotation/freezed_annotation.dart';

part 'testimonial_model.freezed.dart';
part 'testimonial_model.g.dart';

@freezed
class TestimonialModel with _$TestimonialModel {
  const factory TestimonialModel({
    @Default("") String displayName,
    @Default("") String avatar,
    @Default("") String position,
    @Default("") String recommendation,
  }) = _TestimonialModel;

  factory TestimonialModel.fromJson(Map<String, Object?> json) =>
      _$TestimonialModelFromJson(json);
}
