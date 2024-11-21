import 'package:boris_ilic_portfolio/features/about/components/services_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/core/dependency_injection/di.dart';
import 'package:boris_ilic_portfolio/features/about/cubit/about_detail_cubit.dart';
import 'package:boris_ilic_portfolio/features/about/model/about_detail_model.dart';
import 'package:boris_ilic_portfolio/gen/assets.gen.dart';

/// A widget that displays the About section of the portfolio.
/// Uses BLoC pattern for state management and displays about information
/// including services and images.
class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<AboutDetailCubit>()..getAboutData(),
      child: BlocBuilder<AboutDetailCubit, AsyncValue<AboutDetailState>>(
        builder: (context, state) {
          return state.when(
            initial: (_) => const _LoadingIndicator(),
            loading: (_) => const _LoadingIndicator(),
            error: (_, error, __) => _ErrorDisplay(error: error),
            data: (data) => _AboutContent(aboutDetail: data.aboutDetailModel),
          );
        },
      ),
    );
  }
}

/// Displays a loading indicator centered on the screen
class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const Center(child: CircularProgressIndicator());
  }
}

/// Displays an error message centered on the screen
class _ErrorDisplay extends StatelessWidget {
  final String error;

  const _ErrorDisplay({required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Error: $error',
        style: FontStyles.fontRegular14,
      ),
    );
  }
}

/// Main content widget for the About section
class _AboutContent extends StatelessWidget {
  final AboutDetailModel aboutDetail;

  // Layout constants
  static const double _horizontalPadding = 15.0;
  static const double _verticalPadding = 20.0;
  static const double _sectionSpacing = 30.0;
  static const double _smallSpacing = 15.0;

  const _AboutContent({required this.aboutDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: ColorPalette.purple30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const _HeaderImage(),
          const SizedBox(height: _verticalPadding),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: _horizontalPadding,
              vertical: _verticalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _SectionTitle('About Service'),
                const SizedBox(height: _smallSpacing),
                _BodyText(aboutDetail.aboutService),
                const SizedBox(height: _sectionSpacing),
                const _SectionTitle('Services Include:'),
                const SizedBox(height: _verticalPadding),
                ServicesList(services: aboutDetail.services),
                const SizedBox(height: _sectionSpacing),
              ],
            ),
          ),
          const _FooterImages(),
        ],
      ),
    );
  }
}

/// Displays the header image with consistent sizing
class _HeaderImage extends StatelessWidget {
  static const double _imageHeight = 400.0;

  const _HeaderImage();

  @override
  Widget build(BuildContext context) {
    return Assets.images.about1.image(
      height: _imageHeight,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}

/// Renders section titles with consistent styling
class _SectionTitle extends StatelessWidget {
  final String title;

  const _SectionTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: FontStyles.fontRegular14.copyWith(color: ColorPalette.white),
    );
  }
}

/// Renders body text with consistent styling
class _BodyText extends StatelessWidget {
  final String text;

  const _BodyText(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: FontStyles.fontRegular14.copyWith(
        color: ColorPalette.gray,
        height: 1.5,
      ),
    );
  }
}

/// Displays footer images with consistent sizing
class _FooterImages extends StatelessWidget {
  static const double _imageHeight = 400.0;

  const _FooterImages();

  @override
  Widget build(BuildContext context) {
    return Assets.icons.about2.image(
      height: _imageHeight,
      width: double.infinity,
      fit: BoxFit.fitWidth,
    );
  }
}
