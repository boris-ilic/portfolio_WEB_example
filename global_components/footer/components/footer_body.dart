import 'package:boris_ilic_portfolio/constants/assets/icon_constants.dart';
import 'package:boris_ilic_portfolio/constants/assets/image_constants.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/utils/app_utils.dart';
import 'package:boris_ilic_portfolio/features/navigation/bloc/navigation_bloc.dart';
import 'package:boris_ilic_portfolio/global_components/footer/components/footer_bussines_card.dart';
import 'package:boris_ilic_portfolio/global_components/footer/components/footer_label.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class FooterBody extends StatelessWidget {
  const FooterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth <= 800) {
          return _SmallFooterBody();
        } else if (constraints.maxWidth <= 1200) {
          return _MediumFooterBody();
        } else {
          return _LargeFooterBody();
        }
      },
    );
  }
}

class _LargeFooterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildScanSection(),
          _buildMeetingSection(context),
          _buildNavigationSection(context),
          _buildContactSection(),
        ],
      ),
    );
  }
}

class _MediumFooterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      child: Wrap(
        spacing: 40,
        runSpacing: 40,
        alignment: WrapAlignment.spaceAround,
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          _buildScanSection(),
          _buildMeetingSection(context),
          _buildNavigationSection(context),
          _buildContactSection(),
        ],
      ),
    );
  }
}

class _SmallFooterBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Column(
        children: [
          _buildScanSection(),
          const SizedBox(height: 32),
          _buildMeetingSection(context),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: _buildNavigationSection(context)),
              const SizedBox(width: 24),
              Expanded(child: _buildContactSection()),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _buildScanSection() {
  return ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 300),
    child: Column(
      children: [
        Text(
          "Scan",
          style: FontStyles.fontRegular14,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 24,
          runSpacing: 24,
          alignment: WrapAlignment.center,
          children: [
            BusinessCardWidget(
              logoImage: AppImages.linkedIn,
              qrCodeImage: AppImages.qrLinkedIn,
            ),
            BusinessCardWidget(
              logoImage: AppImages.telegram,
              qrCodeImage: AppImages.qrTelegram,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget _buildMeetingSection(BuildContext context) {
  return ConstrainedBox(
    constraints: const BoxConstraints(maxWidth: 200),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Book a meeting",
          style: FontStyles.fontRegular14,
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () =>
              _launchUrl("https://calendar.app.google/Q7uKvArUnhS6BTyB9"),
          child: SvgPicture.asset(
            AppIcons.googleCalendar,
            width: Sizes.size150,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          "Click on icon for booking",
          style: FontStyles.fontRegular14.copyWith(
            color: ColorPalette.gray20,
          ),
        ),
      ],
    ),
  );
}

Widget _buildNavigationSection(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Navigation",
        style: FontStyles.fontRegular14,
      ),
      const SizedBox(height: 8),
      ...pages.entries.map(
        (page) => FooterLabel(
          text: getPageName(context, page.key),
          onTap: () =>
              context.read<NavigationBloc>().changeTabIndex(page.key, context),
        ),
      ),
    ],
  );
}

Widget _buildContactSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        "Contact",
        style: FontStyles.fontRegular14,
      ),
      const SizedBox(height: 8),
      FooterLabel(
        text: "+381643652091",
        onTap: () {
          AppUtils.openLinkInNewTab("tel:+381643652091");
        },
      ),
      FooterLabel(
        text: "https://boris-ilic.github.io/portfolio_live/",
        onTap: () {},
      ),
      FooterLabel(
        text: "ilicborisdev@gmail.com",
        onTap: () {},
      ),
      FooterLabel(
        text: "Github User: boris-ilic",
        onTap: () async {
          AppUtils.openLinkInNewTab("https://github.com/boris-ilic");
        },
      ),
      FooterLabel(
        text: "Vuka Karadzica 9a 11130,\nBelgrade, Serbia",
        onTap: () {},
      ),
      FooterLabel(
        text: "Download CV",
        onTap: () {
          AppUtils.downloadFirebaseFile("resume.pdf");
        },
      ),
    ],
  );
}

Future<void> _launchUrl(String urlString) async {
  final Uri url = Uri.parse(urlString);
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}
