import 'package:boris_ilic_portfolio/features/blog/model/blog_feed_model.dart';
import 'package:dio/dio.dart';

class BlogRepository {
  static final BlogRepository _instance = BlogRepository._internal();

  factory BlogRepository() {
    return _instance;
  }

  BlogRepository._internal();
  final Dio _dio = Dio();
  final String _baseUrl = 'https://api.rss2json.com/v1/api.json';
  final String _rssUrl = 'https://medium.com/feed/@ilicborisdev';

  Future<BlogFeedModelList> fetchBlogPosts() async {
    try {
      final response = await _dio.get(_baseUrl, queryParameters: {
        'rss_url': _rssUrl,
      });

      if (response.statusCode == 200) {
        return BlogFeedModelList.fromJson(response.data);
      } else {
        throw Exception('Failed to load blog posts');
      }
    } catch (e) {
      throw Exception('Error fetching blog posts: $e');
    }
  }
}
