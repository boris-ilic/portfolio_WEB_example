import 'package:boris_ilic_portfolio/features/service/components/service_container.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:flutter/material.dart';

class ServicesSection extends StatelessWidget {
  final VoidCallback? onSeeAllTap;

  const ServicesSection({
    Key? key,
    required this.onSeeAllTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: _buildScrollableSection(context, isLargeScreen: true),
      mediumScreen: _buildScrollableSection(context, isLargeScreen: false),
      smallScreen: _buildScrollableSection(context, isLargeScreen: false),
    );
  }

  Widget _buildScrollableSection(BuildContext context,
      {required bool isLargeScreen}) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: isLargeScreen
                  ? MainAxisAlignment.spaceEvenly
                  : MainAxisAlignment.start,
              children: _buildServiceContainers().map((service) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: service,
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildServiceContainers() {
    return [
      ServiceContainer(
        onTap: onSeeAllTap,
        title: "Mobile Development",
        subTitle:
            "Developing iOS and Android applications that are robust, user-friendly, and optimized for performance.",
        icon: Icons.phone_android_outlined,
      ),
      ServiceContainer(
        onTap: onSeeAllTap,
        title: "Web Development",
        subTitle:
            "Building responsive and modern web applications that drive engagement and deliver value.",
        icon: Icons.web,
      ),
      ServiceContainer(
        onTap: onSeeAllTap,
        title: "Full IT Support",
        subTitle:
            "Providing comprehensive IT support to streamline operations and ensure smooth technology integration.",
        icon: Icons.people,
      ),
      ServiceContainer(
        onTap: onSeeAllTap,
        title: "Interview Support",
        subTitle:
            "Helping you build your dream team with professional interview support and talent assessment.",
        icon: Icons.people,
      ),
      ServiceContainer(
        onTap: onSeeAllTap,
        title: "Consultancy Support",
        subTitle:
            "Offering expert advice and guidance to help you make informed business and technology decisions.",
        icon: Icons.people,
      ),
    ];
  }
}
