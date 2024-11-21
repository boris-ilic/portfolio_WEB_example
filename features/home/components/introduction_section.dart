import 'package:boris_ilic_portfolio/constants/assets/image_constants.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/home/components/plain_white_button.dart';
import 'package:boris_ilic_portfolio/features/navigation/bloc/navigation_bloc.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/purple_portfolio_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class IntroductionSection extends StatelessWidget {
  IntroductionSection({super.key});

  final List<String> appIcons = [
    "https://firebasestorage.googleapis.com/v0/b/borisilicportfolio.appspot.com/o/maka.webp?alt=media&token=37717aab-df3f-4435-9191-74462bd2f558",
    "https://firebasestorage.googleapis.com/v0/b/borisilicportfolio.appspot.com/o/martrust.webp?alt=media&token=f716c221-90b5-458c-b5b1-31525d853d7b",
    "https://firebasestorage.googleapis.com/v0/b/borisilicportfolio.appspot.com/o/morph.webp?alt=media&token=ec471d86-b3a7-4214-926d-cdd6e231d656",
    "https://firebasestorage.googleapis.com/v0/b/borisilicportfolio.appspot.com/o/endeva.jpg?alt=media&token=aa6c0104-32e7-4e1e-a9ae-ff87ab49b5aa",
    "https://firebasestorage.googleapis.com/v0/b/borisilicportfolio.appspot.com/o/caresalute.webp?alt=media&token=9b2e0412-b565-47eb-9de8-0815162895dd",
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // Define breakpoints
        final isSmallScreen = constraints.maxWidth <= 600;
        final isMediumScreen =
            constraints.maxWidth <= 1024 && constraints.maxWidth > 600;

        // Calculate scale factors based on screen width
        final scaleFactor = isSmallScreen
            ? 0.6
            : isMediumScreen
                ? 0.8
                : 1.0;

        // Adjust padding based on screen size
        final horizontalPadding = isSmallScreen
            ? Sizes.size16
            : isMediumScreen
                ? Sizes.size32
                : Sizes.size60;

        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              children: [
                // Responsive spacing
                SizedBox(height: isSmallScreen ? Sizes.size20 : Sizes.size42),

                // Introduction text with responsive size
                _buildIntroduction(
                  context,
                  scaleFactor: scaleFactor,
                  isSmallScreen: isSmallScreen,
                ),

                SizedBox(height: isSmallScreen ? Sizes.size20 : Sizes.size42),

                // Profile section with statistics
                _buildProfileSection(
                  context,
                  scaleFactor: scaleFactor,
                  isSmallScreen: isSmallScreen,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildIntroduction(
    BuildContext context, {
    required double scaleFactor,
    required bool isSmallScreen,
  }) {
    final baseSize = isSmallScreen ? 40.0 : Sizes.size80 * scaleFactor;

    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "I'm ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: baseSize,
          color: Colors.black,
        ),
        children: [
          TextSpan(
            text: "Boris,",
            style: TextStyle(
              fontSize: baseSize,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              color: ColorPalette.purple,
              decoration: TextDecoration.underline,
            ),
          ),
          TextSpan(
            text: "\nSenior Software Engineer",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: baseSize * 0.8,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileSection(
    BuildContext context, {
    required double scaleFactor,
    required bool isSmallScreen,
  }) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1200),
      child: isSmallScreen
          ? Column(
              children: [
                _buildProfileImage(
                  context,
                  scaleFactor: scaleFactor,
                  isSmallScreen: isSmallScreen,
                ),
                const SizedBox(height: Sizes.size20),
                _buildStatistics(scaleFactor: scaleFactor),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: _buildStatistics(scaleFactor: scaleFactor),
                ),
                Expanded(
                  flex: 3,
                  child: _buildProfileImage(
                    context,
                    scaleFactor: scaleFactor,
                    isSmallScreen: isSmallScreen,
                  ),
                ),
                const Spacer(),
              ],
            ),
    );
  }

  Widget _buildStatistics({required double scaleFactor}) {
    return Container(
      padding: EdgeInsets.all(Sizes.size16 * scaleFactor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "2+ mil",
            style: TextStyle(
              fontSize: 24 * scaleFactor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Happy Users",
            style: TextStyle(fontSize: 16 * scaleFactor),
          ),
          SizedBox(height: Sizes.size16 * scaleFactor),
          _buildAppIcons(scaleFactor),
          SizedBox(height: Sizes.size16 * scaleFactor),
          Text(
            "12+",
            style: TextStyle(
              fontSize: 24 * scaleFactor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Successfully done Apps",
            style: TextStyle(fontSize: 16 * scaleFactor),
          ),
        ],
      ),
    );
  }

  Widget _buildAppIcons(double scaleFactor) {
    return Wrap(
      spacing: -10 * scaleFactor,
      children: appIcons.map((iconUrl) {
        return CircleAvatar(
          backgroundColor: ColorPalette.purple10,
          radius: 20 * scaleFactor,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(30 * scaleFactor),
            child: Image.network(
              iconUrl,
              height: 40 * scaleFactor,
              width: 40 * scaleFactor,
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildProfileImage(
    BuildContext context, {
    required double scaleFactor,
    required bool isSmallScreen,
  }) {
    final containerSize = isSmallScreen ? 300.0 : 400.0 * scaleFactor;

    return Container(
      height: containerSize,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background containers
          Positioned(
            bottom: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildColoredContainer(
                  ColorPalette.purple,
                  containerSize * 0.875,
                  containerSize * 0.5,
                  scaleFactor,
                  topLeft: true,
                ),
                _buildColoredContainer(
                  ColorPalette.gray10,
                  containerSize * 0.75,
                  containerSize * 0.5,
                  scaleFactor,
                  topRight: true,
                ),
              ],
            ),
          ),
          // Profile image
          Positioned(
            child: Image.asset(
              AppImages.me,
              height: containerSize,
              width: containerSize,
              fit: BoxFit.contain,
            ),
          ),
          // Action buttons
          Positioned(
            bottom: Sizes.size20 * scaleFactor,
            child: _buildActionButtons(context, scaleFactor, isSmallScreen),
          ),
        ],
      ),
    );
  }

  Widget _buildColoredContainer(
    Color color,
    double height,
    double width,
    double scaleFactor, {
    bool topLeft = false,
    bool topRight = false,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.only(
          topLeft: topLeft ? const Radius.circular(Sizes.size32) : Radius.zero,
          topRight:
              topRight ? const Radius.circular(Sizes.size32) : Radius.zero,
        ),
      ),
    );
  }

  Widget _buildActionButtons(
    BuildContext context,
    double scaleFactor,
    bool isSmallScreen,
  ) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final containerWidth = isSmallScreen ? 240.0 : 340.0 * scaleFactor;
        final containerHeight = isSmallScreen ? 40.0 : 50.0 * scaleFactor;
        final buttonSpacing = isSmallScreen ? 4.0 : 8.0;

        return Container(
          width: containerWidth,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(
              isSmallScreen ? Sizes.size24 : Sizes.size32 * scaleFactor,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(
              isSmallScreen ? Sizes.size24 : Sizes.size32 * scaleFactor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: PurplePortfolioButton(
                    label: "Projects",
                    onTap: () {
                      context.read<NavigationBloc>().changeTabIndex(3, context);
                    },
                  ),
                ),
                SizedBox(width: buttonSpacing),
                Container(
                  width: 1,
                  height: containerHeight * 0.6,
                  color: ColorPalette.gray10,
                ),
                SizedBox(width: buttonSpacing),
                Expanded(
                  child: PlainWhiteButton(
                    label: "Hire me",
                    onTap: () {
                      context.goNamed(AppRoutes.contactScreen);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
