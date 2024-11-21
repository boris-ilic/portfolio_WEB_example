import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/base/base_async_state.dart';
import 'package:boris_ilic_portfolio/core/dependency_injection/di.dart';
import 'package:boris_ilic_portfolio/features/home/components/education_tile.dart';
import 'package:boris_ilic_portfolio/features/home/components/work_experience_tile.dart';
import 'package:boris_ilic_portfolio/features/home/cubit/experience_cubit.dart';
import 'package:boris_ilic_portfolio/global_components/text/double_title.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => get<ExperienceCubit>()..getWorkExperienceList(),
      child: BlocBuilder<ExperienceCubit, AsyncValue<ExperienceState>>(
        builder: (context, state) {
          return ResponsiveWidget(
            largeScreen: _buildLargeScreen(context, state),
            mediumScreen: _buildMediumScreen(context, state),
            smallScreen: _buildSmallScreen(context, state),
          );
        },
      ),
    );
  }

  /// Builds the experience section for large screens
  Widget _buildLargeScreen(
      BuildContext context, AsyncValue<ExperienceState> state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitle(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildEducationSection(context, state),
            _buildWorkSection(context, state),
          ],
        ),
      ],
    );
  }

  /// Builds the experience section for medium screens with added padding
  Widget _buildMediumScreen(
      BuildContext context, AsyncValue<ExperienceState> state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildTitle(),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildEducationSection(context, state),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: _buildWorkSection(context, state),
              ),
            ),
          ],
        ),
      ],
    );
  }

  /// Builds the experience section for small screens with a scrollable layout
  Widget _buildSmallScreen(
      BuildContext context, AsyncValue<ExperienceState> state) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTitle(),
            const SizedBox(height: 24),
            _buildEducationSection(context, state),
            const SizedBox(height: 32),
            _buildWorkSection(context, state),
          ],
        ),
      ),
    );
  }

  /// Builds the title section displayed at the top of each screen size layout
  Widget _buildTitle() {
    return const DoubleTitle(
      subtitle: "Education & Work",
      titleBlack: "My Education",
      titlePurple: " & Work Experience",
      isCentered: true,
    );
  }

  /// Builds the education section with a styled header and list of education experiences
  Widget _buildEducationSection(
      BuildContext context, AsyncValue<ExperienceState> state) {
    return Container(
      width: ResponsiveWidget.isSmallScreen(context)
          ? double.infinity
          : Sizes.size500,
      decoration: const BoxDecoration(
        color: ColorPalette.gray,
        borderRadius: BorderRadius.all(Radius.circular(Sizes.size32)),
      ),
      child: Column(
        children: [
          _buildSectionHeader(icon: Icons.school_rounded, title: "Education"),
          const Divider(
              thickness: 1, indent: Sizes.size16, endIndent: Sizes.size16),
          _buildEducationList(state),
        ],
      ),
    );
  }

  /// Builds the work experience section with a styled header and list of work experiences
  Widget _buildWorkSection(
      BuildContext context, AsyncValue<ExperienceState> state) {
    return Container(
      width: ResponsiveWidget.isSmallScreen(context)
          ? double.infinity
          : Sizes.size500,
      decoration: const BoxDecoration(
        color: ColorPalette.gray,
        borderRadius: BorderRadius.all(Radius.circular(Sizes.size32)),
      ),
      child: Column(
        children: [
          _buildSectionHeader(
              icon: Icons.work_history, title: "Work Experience"),
          const Divider(
              thickness: 1, indent: Sizes.size16, endIndent: Sizes.size16),
          _buildWorkList(state),
        ],
      ),
    );
  }

  /// Builds the header for each section (Education and Work) with an icon and title
  Widget _buildSectionHeader({required IconData icon, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(Sizes.size20),
          width: Sizes.size50,
          height: Sizes.size50,
          decoration: const BoxDecoration(
            color: ColorPalette.purple,
            borderRadius: BorderRadius.all(Radius.circular(Sizes.size25)),
          ),
          child: Icon(icon, color: ColorPalette.white),
        ),
        Text(title, style: FontStyles.fontRegular14),
      ],
    );
  }

  /// Builds the list of education experiences
  Widget _buildEducationList(AsyncValue<ExperienceState> state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.data?.educationExperienceList.length ?? 0,
      itemBuilder: (context, index) {
        final isLast = index == state.data!.educationExperienceList.length - 1;
        return EducationTile(
          education: state.data!.educationExperienceList[index],
          isFirst: index == 0,
          isLast: isLast,
        );
      },
    );
  }

  /// Builds the list of work experiences
  Widget _buildWorkList(AsyncValue<ExperienceState> state) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: state.data?.workExperienceList.length ?? 0,
      itemBuilder: (context, index) {
        final isLast = index == state.data!.workExperienceList.length - 1;
        return WorkExperienceTile(
          work: state.data!.workExperienceList[index],
          isFirst: index == 0,
          isLast: isLast,
        );
      },
    );
  }
}
