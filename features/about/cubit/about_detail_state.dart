part of 'about_detail_cubit.dart';

@freezed
class AboutDetailState with _$AboutDetailState {
  const factory AboutDetailState({
    @Default(AboutDetailModel()) AboutDetailModel aboutDetailModel,
  }) = _AboutDetailState;
}
