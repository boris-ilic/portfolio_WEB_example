import 'package:boris_ilic_portfolio/features/blog/components/blog_grid_card_item.dart';
import 'package:boris_ilic_portfolio/features/blog/model/blog_feed_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

/// A grid widget for displaying blog feed items
class BlogFeedGrid extends StatelessWidget {
  final List<BlogFeedModel> blogFeedList;
  final int? numberOfPosts;

  const BlogFeedGrid({
    super.key,
    required this.blogFeedList,
    this.numberOfPosts,
  });

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  /// Calculates the number of columns based on screen width
  int _getGridCrossAxisCount(double width) {
    if (width < 600) return 1;
    if (width < 900) return 2;
    if (width < 1200) return 3;
    return 4;
  }

  /// Calculates the aspect ratio for grid items based on screen width
  double _getChildAspectRatio(double width) {
    if (width < 600) return 1.0;
    if (width < 900) return 0.9;
    return 1.0;
  }

  /// Returns appropriate padding based on screen width
  EdgeInsets _getPadding(double width) {
    return EdgeInsets.all(width < 600 ? 8 : 16);
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final spacing = screenWidth < 600 ? 8.0 : 16.0;
    final itemCount = _calculateItemCount();

    return Padding(
      padding: _getPadding(screenWidth),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: _createGridDelegate(constraints.maxWidth, spacing),
            itemCount: itemCount,
            itemBuilder: (context, index) => _buildGridItem(index),
          );
        },
      ),
    );
  }

  /// Creates grid delegate with appropriate parameters
  SliverGridDelegateWithFixedCrossAxisCount _createGridDelegate(
    double width,
    double spacing,
  ) {
    return SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: _getGridCrossAxisCount(width),
      crossAxisSpacing: spacing,
      mainAxisSpacing: spacing,
      childAspectRatio: _getChildAspectRatio(width),
    );
  }

  /// Builds individual grid items
  Widget _buildGridItem(int index) {
    final post = blogFeedList[index];
    return BlogGridCardTile(
      thumbnail: post.thumbnail,
      title: post.title,
      categoryList: post.categories,
      onTap: () => _launchUrl(post.link),
    );
  }

  /// Calculates the number of items to display
  int _calculateItemCount() {
    if (numberOfPosts == null) return blogFeedList.length;
    return numberOfPosts! > blogFeedList.length
        ? blogFeedList.length
        : numberOfPosts!;
  }
}
