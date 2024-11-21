import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:recase/recase.dart';

/// A grid card tile widget specifically designed for blog posts display.
///
/// This widget creates a responsive card that displays a blog post preview,
/// including a thumbnail image, categories, and title. It features hover
/// effects and responsive sizing based on screen width.
class BlogGridCardTile extends StatefulWidget {
  /// The URL of the blog post's thumbnail image
  final String thumbnail;

  /// The title of the blog post
  final String title;

  /// List of categories associated with the blog post
  final List<String> categoryList;

  /// Callback function to handle tap events
  final VoidCallback onTap;

  const BlogGridCardTile({
    super.key,
    required this.thumbnail,
    required this.title,
    required this.categoryList,
    required this.onTap,
  });

  @override
  State<BlogGridCardTile> createState() => _BlogGridCardTileState();
}

class _BlogGridCardTileState extends State<BlogGridCardTile> {
  // Tracks whether the card is currently being hovered over
  bool _isHovered = false;

  // Constants for responsive design
  static const double _mobileBreakpoint = 600.0;
  static const double _tabletBreakpoint = 900.0;

  /// Calculates the appropriate title height based on screen width
  double _calculateTitleHeight(double screenWidth) {
    if (screenWidth < _mobileBreakpoint) return 60;
    if (screenWidth < _tabletBreakpoint) return 55;
    return 50;
  }

  /// Returns responsive dimensions based on screen width
  Map<String, double> _getResponsiveDimensions(double screenWidth) {
    return {
      'imageHeight': screenWidth < _mobileBreakpoint ? 200.0 : 180.0,
      'titleFontSize': screenWidth < _mobileBreakpoint ? 16.0 : 18.0,
      'categoryFontSize': screenWidth < _mobileBreakpoint ? 12.0 : 14.0,
      'categoryPaddingH': screenWidth < _mobileBreakpoint ? 6.0 : 8.0,
      'categoryPaddingV': screenWidth < _mobileBreakpoint ? 4.0 : 6.0,
      'categoryMargin': screenWidth < _mobileBreakpoint ? 2.0 : 4.0,
    };
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final dimensions = _getResponsiveDimensions(screenWidth);

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: LayoutBuilder(
          builder: (context, constraints) => _buildCardContent(dimensions),
        ),
      ),
    );
  }

  /// Builds the main content of the card
  Widget _buildCardContent(Map<String, double> dimensions) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        _buildThumbnailSection(dimensions['imageHeight']!),
        const SizedBox(height: 8),
        _buildCategoriesList(dimensions),
        const SizedBox(height: 8),
        _buildTitle(dimensions['titleFontSize']!),
      ],
    );
  }

  /// Builds the thumbnail image section with hover effect
  Widget _buildThumbnailSection(double imageHeight) {
    return Container(
      height: imageHeight,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          _buildHeroImage(imageHeight),
          _buildHoverOverlay(),
        ],
      ),
    );
  }

  /// Builds the hero image with error handling
  Widget _buildHeroImage(double imageHeight) {
    return Hero(
      tag: widget.title,
      child: Image.network(
        widget.thumbnail,
        height: imageHeight,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Center(
            child: FlutterLogo(
          size: 100,
        )),
      ),
    );
  }

  /// Builds the hover overlay with animation
  Widget _buildHoverOverlay() {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: _isHovered ? 1.0 : 0.0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.black.withOpacity(0.7),
              Colors.black.withOpacity(0.3),
            ],
          ),
        ),
        child: const Center(
          child: CircleAvatar(
            backgroundColor: ColorPalette.green,
            child: Icon(Icons.arrow_outward),
          ),
        ),
      ),
    );
  }

  /// Builds the horizontal scrolling categories list
  Widget _buildCategoriesList(Map<String, double> dimensions) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.categoryList.length,
        itemBuilder: (context, index) => _buildCategoryChip(
          widget.categoryList[index],
          dimensions,
        ),
      ),
    );
  }

  /// Builds individual category chips
  Widget _buildCategoryChip(String category, Map<String, double> dimensions) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: dimensions['categoryPaddingH']!,
        vertical: dimensions['categoryPaddingV']!,
      ),
      margin: EdgeInsets.all(dimensions['categoryMargin']!),
      decoration: BoxDecoration(
        color: ColorPalette.green,
        borderRadius: BorderRadius.circular(32),
      ),
      child: Center(
        child: Text(
          category.titleCase,
          style: TextStyle(
            fontSize: dimensions['categoryFontSize'],
            color: ColorPalette.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  /// Builds the title section with ellipsis
  Widget _buildTitle(double fontSize) {
    return SizedBox(
      height: _calculateTitleHeight(MediaQuery.of(context).size.width),
      child: Text(
        widget.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: fontSize,
          height: 1.2,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
