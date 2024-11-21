import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/utils/app_utils.dart';
import 'package:boris_ilic_portfolio/features/home/components/about_me_yeasrs_of_experience.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/section_button.dart';
import 'package:boris_ilic_portfolio/global_components/text/double_title.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:flutter/material.dart';

/// A responsive section displaying information about the developer
/// including years of experience, projects completed, and industries covered.
class AboutMeSection extends StatelessWidget {
  /// Constants for statistics
  static const String _projectsCount = "20+";
  static const String _industriesCount = "8+";
  static const String _subtitle = "About Me";
  static const String _titleBlack = "Who is";
  static const String _titlePurple = "\nBoris Ilić?";
  static const String _description = "Software developer from Serbia";

  const AboutMeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: _buildAboutMeLarge(),
      mediumScreen: _buildAboutMeMedium(),
      smallScreen: _buildAboutMeSmall(),
    );
  }

  /// Builds the layout for large screens
  Widget _buildAboutMeLarge() {
    return SizedBox(
      width: double.maxFinite,
      height: Sizes.size500,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const AboutMeYearsOfExperienceWidget(),
          _buildContentColumn(
            statistics: _buildProjectStatistics(),
            bottomPadding: Sizes.size100,
          ),
        ],
      ),
    );
  }

  /// Builds the layout for medium screens
  Widget _buildAboutMeMedium() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size20),
      constraints: const BoxConstraints(minHeight: Sizes.size500),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Flexible(
            flex: 2,
            child: AboutMeYearsOfExperienceWidget(),
          ),
          const SizedBox(width: Sizes.size42),
          Flexible(
            flex: 3,
            child: _buildContentColumn(
              statistics: _buildProjectStatistics(),
              bottomPadding: Sizes.size60,
              centerText: true,
            ),
          ),
        ],
      ),
    );
  }

  /// Builds the layout for small screens
  Widget _buildAboutMeSmall() {
    return Container(
      width: double.maxFinite,
      padding: const EdgeInsets.all(Sizes.size20),
      constraints: const BoxConstraints(minHeight: Sizes.size500),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const DoubleTitle(
            subtitle: _subtitle,
            titleBlack: _titleBlack,
            titlePurple: _titlePurple,
            isCentered: true,
          ),
          _buildDescription(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size16,
            ),
            centerText: true,
          ),
          const SizedBox(height: Sizes.size20),
          const AboutMeYearsOfExperienceWidget(),
          const SizedBox(height: Sizes.size42),
          _buildProjectStatisticsSmall(),
          const SizedBox(height: Sizes.size42),
          _buildDownloadButton(),
        ],
      ),
    );
  }

  /// Builds the main content column with title, description, and statistics
  Widget _buildContentColumn({
    required Widget statistics,
    double bottomPadding = 0,
    bool centerText = false,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const DoubleTitle(
          subtitle: _subtitle,
          titleBlack: _titleBlack,
          titlePurple: _titlePurple,
        ),
        _buildDescription(
          padding: EdgeInsets.only(bottom: Sizes.size20),
          centerText: centerText,
        ),
        statistics,
        SizedBox(height: bottomPadding),
        _buildDownloadButton(),
      ],
    );
  }

  /// Builds the description text with customizable padding and alignment
  Widget _buildDescription({
    required EdgeInsetsGeometry padding,
    bool centerText = false,
  }) {
    return Padding(
      padding: padding,
      child: Text(
        _description,
        style: FontStyles.fontRegular14.copyWith(color: ColorPalette.black),
        textAlign: centerText ? TextAlign.center : TextAlign.start,
      ),
    );
  }

  /// Builds the download CV button
  Widget _buildDownloadButton() {
    return SectionButton(
      label: "Download CV",
      onTap: () {
        AppUtils.downloadFirebaseFile("resume.pdf");
      },
    );
  }

  /// Builds the horizontal statistics layout for large and medium screens
  Widget _buildProjectStatistics() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStatisticItem(_projectsCount, "Project completed"),
        const SizedBox(width: Sizes.size20),
        _buildStatisticItem(_industriesCount, "Industry Covered"),
      ],
    );
  }

  /// Builds the vertical statistics layout for small screens
  Widget _buildProjectStatisticsSmall() {
    return Column(
      children: [
        _buildStatisticItem(_projectsCount, "Project completed"),
        const SizedBox(height: Sizes.size16),
        _buildStatisticItem(_industriesCount, "Industry Covered"),
      ],
    );
  }

  /// Builds an individual statistic item with value and label
  Widget _buildStatisticItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: FontStyles.fontRegular14.copyWith(
            color: ColorPalette.black,
            height: 1.2,
          ),
        ),
        Text(
          label,
          style: FontStyles.fontRegular14.copyWith(
            color: ColorPalette.black,
            height: 1.2,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
