import 'package:boris_ilic_portfolio/constants/assets/image_constants.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/section_button.dart';
import 'package:boris_ilic_portfolio/global_components/footer/footer.dart';
import 'package:boris_ilic_portfolio/global_components/forms/contact_us_form.dart';
import 'package:boris_ilic_portfolio/global_components/green_line.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// A responsive contact screen that displays personal information and a contact form.
///
/// This screen adapts its layout based on the screen size (large, medium, small)
/// and includes a header with personal information, an image, and a contact form.
class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildBackButton(context),
            ResponsiveWidget(
              largeScreen: _buildLargeScreen(context),
              mediumScreen: _buildMediumScreen(context),
              smallScreen: _buildSmallScreen(context),
            ),
            const HorizontalGreenLine(),
            const Footer()
          ],
        ),
      ),
    );
  }

  /// Builds the back button section with consistent padding
  Widget _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SectionButton(
        label: "Back",
        isBack: true,
        onTap: () => context.go('/'),
      ),
    );
  }

  /// Builds the layout for large screens (desktop)
  ///
  /// Features a side-by-side arrangement of text and image
  Widget _buildLargeScreen(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: _buildHeaderText(),
              ),
            ),
            _buildProfileImage(Sizes.size500),
          ],
        ),
        const ResponsiveContactContent(isLargeScreen: true),
      ],
    );
  }

  /// Builds the layout for medium screens (tablet)
  ///
  /// Similar to large screen but with adjusted dimensions
  Widget _buildMediumScreen(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildHeaderText(fontSize: Sizes.size60),
              ),
            ),
            _buildProfileImage(Sizes.size400),
          ],
        ),
        const ResponsiveContactContent(isLargeScreen: false),
      ],
    );
  }

  /// Builds the layout for small screens (mobile)
  ///
  /// Stacks elements vertically for better mobile viewing
  Widget _buildSmallScreen(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: _buildHeaderText(fontSize: Sizes.size42),
        ),
        _buildProfileImage(Sizes.size300),
        const ResponsiveContactContent(isLargeScreen: false),
      ],
    );
  }

  /// Builds the profile image with specified dimensions
  Widget _buildProfileImage(double size) {
    return Image.asset(
      AppImages.me,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }

  /// Builds the header text with customizable font size
  ///
  /// Creates a rich text widget with styled name and title
  Widget _buildHeaderText({double fontSize = Sizes.size80}) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: "I'm ",
        style: _getHeaderStyle(fontSize),
        children: [
          TextSpan(
            text: "Boris,",
            style: _getNameStyle(fontSize),
          ),
          TextSpan(
            text: "\nSenior Software Engineer",
            style: _getHeaderStyle(fontSize),
          ),
        ],
      ),
    );
  }

  /// Returns the base style for header text
  TextStyle _getHeaderStyle(double fontSize) {
    return TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
    );
  }

  /// Returns the style for the name portion of the header
  TextStyle _getNameStyle(double fontSize) {
    return FontStyles.fontBoldPurple16.copyWith(
      fontSize: fontSize,
      fontStyle: FontStyle.italic,
      decoration: TextDecoration.underline,
    );
  }
}
