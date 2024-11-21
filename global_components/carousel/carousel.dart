import 'dart:async';
import 'package:flutter/material.dart';
import 'package:boris_ilic_portfolio/features/home/model/testimonial_model.dart';
import 'package:boris_ilic_portfolio/global_components/carousel/carosel_bottom_dots.dart';

class ResponsiveCarousel extends StatefulWidget {
  final List<TestimonialModel> items;
  final bool isSmallScreen;
  final bool isMediumScreen;

  const ResponsiveCarousel({
    Key? key,
    required this.items,
    required this.isSmallScreen,
    required this.isMediumScreen,
  }) : super(key: key);

  @override
  State<ResponsiveCarousel> createState() => _ResponsiveCarouselState();
}

class _ResponsiveCarouselState extends State<ResponsiveCarousel> {
  late PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: _getViewportFraction());
    _startTimer();
  }

  double _getViewportFraction() {
    if (widget.isSmallScreen) return 0.95;
    if (widget.isMediumScreen) return 0.7;
    return 0.45; // Slightly smaller for large screens
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_pageController.hasClients) {
        final nextPage = (_currentPage + 1) % widget.items.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  EdgeInsets _getPadding() {
    if (widget.isSmallScreen) {
      return const EdgeInsets.all(16);
    }
    if (widget.isMediumScreen) {
      return const EdgeInsets.all(24);
    }
    return const EdgeInsets.all(32);
  }

  double _getAvatarRadius() {
    if (widget.isSmallScreen) return 30;
    if (widget.isMediumScreen) return 40;
    return 45;
  }

  double _getFontSize(bool isTitle) {
    if (widget.isSmallScreen) {
      return isTitle ? 16 : 14;
    }
    if (widget.isMediumScreen) {
      return isTitle ? 18 : 16;
    }
    return isTitle ? 22 : 18;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final double cardHeight = constraints.maxHeight;
        return Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _currentPage = index);
                },
                itemCount: widget.items.length,
                itemBuilder: (context, index) {
                  return _buildTestimonialCard(
                    widget.items[index],
                    constraints,
                    cardHeight,
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            CarouselBottomDots(
              rectangleNumber: widget.items.length,
              currentRectangle: _currentPage,
              onRectangleTapped: (index) {
                _pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTestimonialCard(
    TestimonialModel testimonial,
    BoxConstraints constraints,
    double cardHeight,
  ) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.isSmallScreen ? 4 : 12,
        vertical: 8,
      ),
      padding: _getPadding(),
      constraints: BoxConstraints(
        maxWidth: widget.isSmallScreen
            ? constraints.maxWidth * 0.95
            : widget.isMediumScreen
                ? 600
                : 700,
        maxHeight: cardHeight - 40, // Account for dots and margins
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: _getAvatarRadius(),
            backgroundImage: NetworkImage(testimonial.avatar),
          ),
          SizedBox(height: widget.isSmallScreen ? 16 : 24),
          Text(
            testimonial.displayName,
            style: TextStyle(
              fontSize: _getFontSize(true),
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            testimonial.position,
            style: TextStyle(
              fontSize: _getFontSize(false),
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: widget.isSmallScreen ? 16 : 24),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: widget.isSmallScreen ? 8 : 16,
                ),
                child: Text(
                  testimonial.recommendation,
                  style: TextStyle(
                    fontSize: _getFontSize(false),
                    height: 1.6,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
