import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/utils/app_utils.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/section_button.dart';
import 'package:boris_ilic_portfolio/global_components/footer/components/footer_body.dart';
import 'package:boris_ilic_portfolio/global_components/footer/footer_header.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreen: _LargeFooter(),
      mediumScreen: _MediumFooter(),
      smallScreen: _SmallFooter(),
    );
  }
}

class _LargeFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.05; // 5% of screen width

    return Container(
      constraints: const BoxConstraints(minHeight: 450),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(
                  child: FooterHeader(
                    titleBlack: "Let's",
                    titlePurple: "Connect",
                    subtitle: "there",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: screenWidth * 0.02,
                  ),
                  child: SectionButton(
                    label: "Hire me now",
                    onTap: () => context.goNamed(AppRoutes.contactScreen),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: horizontalPadding,
            endIndent: horizontalPadding,
          ),
          const Flexible(
            child: FooterBody(),
          ),
          Divider(
            thickness: 2,
            indent: horizontalPadding,
            endIndent: horizontalPadding,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: screenWidth * 0.02,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                AppUtils.getCopyrightText(),
                style: FontStyles.fontRegular16.copyWith(
                  color: ColorPalette.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MediumFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.06; // 6% of screen width

    return Container(
      constraints: const BoxConstraints(minHeight: 500),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FooterHeader(
                  titleBlack: "Let's",
                  titlePurple: "Connect",
                  subtitle: "there",
                ),
                SizedBox(height: screenWidth * 0.02),
                SectionButton(
                  label: "Hire me now",
                  onTap: () => context.goNamed(AppRoutes.contactScreen),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: horizontalPadding,
            endIndent: horizontalPadding,
          ),
          const Flexible(child: FooterBody()),
          Divider(
            thickness: 2,
            indent: horizontalPadding,
            endIndent: horizontalPadding,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: screenWidth * 0.03,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              alignment: Alignment.centerRight,
              child: Text(
                AppUtils.getCopyrightText(),
                style: FontStyles.fontRegular16.copyWith(
                  color: ColorPalette.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallFooter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth * 0.08; // 8% of screen width

    return Container(
      constraints: const BoxConstraints(minHeight: 600),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FooterHeader(
                  titleBlack: "Let's",
                  titlePurple: "Connect",
                  subtitle: "there",
                ),
                SizedBox(height: screenWidth * 0.04),
                Center(
                  child: SizedBox(
                    child: SectionButton(
                      label: "Hire me now",
                      onTap: () => context.goNamed(AppRoutes.contactScreen),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 2,
            indent: horizontalPadding,
            endIndent: horizontalPadding,
          ),
          const Flexible(child: FooterBody()),
          Divider(
            thickness: 2,
            indent: horizontalPadding,
            endIndent: horizontalPadding,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: horizontalPadding,
              vertical: screenWidth * 0.04,
            ),
            child: Center(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  AppUtils.getCopyrightText(),
                  style: FontStyles.fontRegular14.copyWith(
                    color: ColorPalette.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
