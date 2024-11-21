import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/about/about_screen.dart';
import 'package:boris_ilic_portfolio/features/project/components/create_project_tile.dart';
import 'package:boris_ilic_portfolio/features/service/components/service_section.dart';
import 'package:boris_ilic_portfolio/global_components/footer/footer.dart';
import 'package:boris_ilic_portfolio/global_components/forms/contact_us_form.dart';
import 'package:boris_ilic_portfolio/global_components/green_line.dart';
import 'package:boris_ilic_portfolio/global_components/section_header.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:flutter/material.dart';

class ServiceScreen extends StatelessWidget {
  final VoidCallback? onSeeAllTap;
  final bool showFooter;

  const ServiceScreen({super.key, this.onSeeAllTap, this.showFooter = true});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            color: ColorPalette.purple,
            width: double.maxFinite,
            height: Sizes.size600,
            child: Column(
              children: [
                SectionHeader(
                  subtitle: "Services",
                  titleWhite: "\nMy ",
                  titleGreen: "Services",
                  buttonLabel: "View All Services",
                  onTap: onSeeAllTap,
                ),
                ServicesSection(onSeeAllTap: onSeeAllTap)
              ],
            ),
          ),
          if (showFooter) ...[
            const HorizontalGreenLine(),
            const AboutSection(),
            const CreateProjectTile(),
            const ResponsiveWidget(
              largeScreen: ResponsiveContactContent(isLargeScreen: true),
              mediumScreen: ResponsiveContactContent(isLargeScreen: false),
              smallScreen: ResponsiveContactContent(isLargeScreen: false),
            ), // const ContactContent(),
            const HorizontalGreenLine(),
            const Footer()
          ]
        ],
      ),
    );
  }
}
