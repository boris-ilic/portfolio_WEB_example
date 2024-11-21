import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/core/dependency_injection/di.dart';
import 'package:boris_ilic_portfolio/features/home/cubit/testimonial_cubit.dart';
import 'package:boris_ilic_portfolio/global_components/carousel/carousel.dart';
import 'package:boris_ilic_portfolio/global_components/text/double_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TestimonialContent extends StatelessWidget {
  const TestimonialContent({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth < 1200 && screenWidth >= 600;

    // Calculate responsive height
    double getCarouselHeight() {
      if (isSmallScreen) {
        return screenHeight * 0.7; // 70% of screen height on mobile
      } else if (isMediumScreen) {
        return screenHeight * 0.6; // 60% of screen height on tablets
      } else {
        return screenHeight * 0.75; // 75% of screen height on desktop
      }
    }

    return BlocProvider(
      create: (context) => get<TestimonialCubit>()..getTestimonialData(),
      child: BlocBuilder<TestimonialCubit, AsyncValue<TestimonialState>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            constraints: const BoxConstraints(maxWidth: 1400),
            padding: EdgeInsets.symmetric(
              horizontal: isSmallScreen ? 16 : 32,
              vertical: isSmallScreen ? 32 : 48,
            ),
            child: Column(
              children: [
                _buildTitleSection(isSmallScreen),
                SizedBox(height: isSmallScreen ? 24 : 40),
                _buildCarouselSection(
                  state,
                  isSmallScreen,
                  isMediumScreen,
                  getCarouselHeight(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTitleSection(bool isSmallScreen) {
    return SizedBox(
      width: isSmallScreen ? double.infinity : 800,
      child: const DoubleTitle(
        subtitle: "Client Testimonials",
        titleBlack: "Testimonials that ",
        titlePurple: "Speaks to my results",
        isCentered: true,
      ),
    );
  }

  Widget _buildCarouselSection(
    AsyncValue<TestimonialState> state,
    bool isSmallScreen,
    bool isMediumScreen,
    double height,
  ) {
    return SizedBox(
      height: height,
      child: state.data != null
          ? ResponsiveCarousel(
              items: state.data!.items,
              isSmallScreen: isSmallScreen,
              isMediumScreen: isMediumScreen,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
