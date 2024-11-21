import 'package:freezed_annotation/freezed_annotation.dart';

part 'blog_feed_model.freezed.dart';
part 'blog_feed_model.g.dart';

@freezed
class BlogFeedModelList with _$BlogFeedModelList {
  const factory BlogFeedModelList({
    @Default([]) List<BlogFeedModel> items,
  }) = _BlogFeedModelList;

  factory BlogFeedModelList.fromJson(Map<String, Object?> json) =>
      _$BlogFeedModelListFromJson(json);
}

@freezed
class BlogFeedModel with _$BlogFeedModel {
  const BlogFeedModel._(); // Add this private constructor

  const factory BlogFeedModel({
    @Default("") String title,
    @Default("") String link,
    @Default("") String description,
    @Default([]) List<String> categories,
  }) = _BlogFeedModel;

  factory BlogFeedModel.fromJson(Map<String, Object?> json) =>
      _$BlogFeedModelFromJson(json);

  String get thumbnail {
    // Regular expression to match image URLs in the description
    final RegExp imgRegExp = RegExp(
      r'<img[^>]+src="([^">]+)"',
      caseSensitive: false,
    );

    // Find the first match in the description
    final match = imgRegExp.firstMatch(description);

    // Return the captured URL or an empty string if no match is found
    return match?.group(1) ?? '';
  }
}
