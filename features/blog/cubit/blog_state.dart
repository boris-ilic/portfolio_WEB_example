part of 'blog_cubit.dart';

@freezed
class BlogState with _$BlogState {
  const factory BlogState({
    @Default([]) List<BlogFeedModel> items,
  }) = _BlogStateModel;
}
