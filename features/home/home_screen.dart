import 'package:boris_ilic_portfolio/features/blog/blog_screen.dart';
import 'package:boris_ilic_portfolio/features/home/components/about_me_section.dart';
import 'package:boris_ilic_portfolio/features/home/components/experience_section.dart';
import 'package:boris_ilic_portfolio/features/home/components/introduction_section.dart';
import 'package:boris_ilic_portfolio/features/home/components/testimonial_content.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/hire_me_round_button.dart';
import 'package:boris_ilic_portfolio/global_components/footer/footer.dart';
import 'package:boris_ilic_portfolio/global_components/forms/contact_us_form.dart';
import 'package:boris_ilic_portfolio/global_components/green_line.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/navigation/bloc/navigation_bloc.dart';
import 'package:boris_ilic_portfolio/features/service/service_screen.dart';
import 'package:boris_ilic_portfolio/features/project/project_screen.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeader(context),
            const SizedBox(height: 10),
            IntroductionSection(),
            _buildServices(context),
            const AboutMeSection(),
            const ExperienceSection(),
            _buildLatestProjects(context),
            const TestimonialContent(),
            const ResponsiveWidget(
              largeScreen: ResponsiveContactContent(isLargeScreen: true),
              mediumScreen: ResponsiveContactContent(isLargeScreen: false),
              smallScreen: ResponsiveContactContent(isLargeScreen: false),
            ),
            const BlogScreen(
              numberOfPosts: 4,
            ),
            const HorizontalGreenLine(),
            const Footer(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: Sizes.size50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: Sizes.size60),
          const Text(
            "- Hello",
            style: TextStyle(color: ColorPalette.black, fontSize: Sizes.size24),
          ),
          HireMeButton(
            onTap: () => context.goNamed(AppRoutes.contactScreen),
          ),
        ],
      ),
    );
  }

  Widget _buildServices(BuildContext context) {
    return ServiceScreen(
      showFooter: false,
      onSeeAllTap: () {
        context.read<NavigationBloc>().changeTabIndex(1, context);
      },
    );
  }

  Widget _buildLatestProjects(BuildContext context) {
    return ProjectScreen(
      maxItems: 2,
      showFooter: false,
      onSeeAllTap: () {
        context.read<NavigationBloc>().changeTabIndex(3, context);
      },
    );
  }
}
