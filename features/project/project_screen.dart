import 'dart:math';
import 'package:boris_ilic_portfolio/features/project/model/project_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/core/dependency_injection/di.dart';
import 'package:boris_ilic_portfolio/features/home/components/testimonial_content.dart';
import 'package:boris_ilic_portfolio/features/project/components/project_item.dart';
import 'package:boris_ilic_portfolio/features/project/cubit/project_cubit.dart';
import 'package:boris_ilic_portfolio/global_components/footer/footer.dart';
import 'package:boris_ilic_portfolio/global_components/green_line.dart';
import 'package:boris_ilic_portfolio/global_components/section_header.dart';

class ProjectScreen extends StatelessWidget {
  final int? maxItems;
  final bool showFooter;
  final String titleWhite;
  final String titleGreen;
  final VoidCallback? onSeeAllTap;

  const ProjectScreen({
    Key? key,
    this.maxItems,
    this.showFooter = true,
    this.titleWhite = "\nMy ",
    this.titleGreen = "Latest Projects",
    this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<ProjectCubit>()..getProjectData(),
      child: BlocBuilder<ProjectCubit, AsyncValue<ProjectState>>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, constraints) {
              final isMobile = constraints.maxWidth < 768;
              final isTablet =
                  constraints.maxWidth >= 768 && constraints.maxWidth <= 1200;

              return SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(maxWidth: 1920),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        color: ColorPalette.purple,
                        child: Column(
                          children: [
                            _buildHeader(context, isMobile),
                            _buildProjectList(
                                state, context, isMobile, isTablet),
                          ],
                        ),
                      ),
                      if (showFooter) ..._buildFooterSection(context, isMobile),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isMobile) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? Sizes.size20 : Sizes.size42,
        vertical: Sizes.size24,
      ),
      child: SectionHeader(
        subtitle: "",
        titleWhite: titleWhite,
        titleGreen: showFooter ? "Project" : titleGreen,
        buttonLabel: maxItems != null ? "See All" : "",
        onTap: onSeeAllTap,
      ),
    );
  }

  Widget _buildProjectList(
    AsyncValue<ProjectState> state,
    BuildContext context,
    bool isMobile,
    bool isTablet,
  ) {
    if (state.data == null) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(Sizes.size42),
          child: CircularProgressIndicator(),
        ),
      );
    }

    final items = state.data!.items;
    final itemCount =
        maxItems != null ? min(maxItems!, items.length) : items.length;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? Sizes.size16 : Sizes.size32,
        vertical: Sizes.size16,
      ),
      child: Column(
        children: List.generate(
          itemCount,
          (index) => Padding(
            padding: const EdgeInsets.only(bottom: Sizes.size32),
            child: _buildProjectItem(
              items[index],
              index.isEven,
              isMobile,
              isTablet,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProjectItem(
    ProjectModel project,
    bool imageOnLeft,
    bool isMobile,
    bool isTablet,
  ) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: isTablet ? 900 : 1200,
        minHeight: isMobile ? 500 : 400,
      ),
      child: ProjectShowcase(
        project: project,
        imageOnLeft: imageOnLeft,
      ),
    );
  }

  List<Widget> _buildFooterSection(BuildContext context, bool isMobile) {
    return [
      const HorizontalGreenLine(),
      const SizedBox(height: Sizes.size16),
      _buildAmazingProjectText(context, isMobile),
      const SizedBox(height: Sizes.size16),
      const HorizontalGreenLine(),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: isMobile ? Sizes.size16 : Sizes.size32,
        ),
        child: const TestimonialContent(),
      ),
      const HorizontalGreenLine(),
      const Footer(),
    ];
  }

  Widget _buildAmazingProjectText(BuildContext context, bool isMobile) {
    final textSize = isMobile ? Sizes.size42 : Sizes.size80;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? Sizes.size16 : Sizes.size32,
      ),
      child: RichText(
        textAlign: TextAlign.center,
        text: TextSpan(
          text: "Let's create an ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize,
          ),
          children: [
            TextSpan(
              text: "\nAmazing Project\n",
              style: FontStyles.fontBoldPurple16.copyWith(
                fontSize: textSize,
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
              ),
            ),
            TextSpan(
              text: "Together!",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: textSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Extension to help with responsive sizing
extension ResponsiveSize on num {
  double responsive(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width > 1200) return toDouble();
    if (width > 768) return toDouble() * 0.8;
    return toDouble() * 0.6;
  }
}
