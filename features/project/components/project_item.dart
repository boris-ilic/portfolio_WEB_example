import 'package:boris_ilic_portfolio/core/utils/app_utils.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/section_button.dart';
import 'package:flutter/material.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/project/model/project_model.dart';
import 'package:boris_ilic_portfolio/global_components/text/green_label.dart';

class ProjectShowcase extends StatefulWidget {
  final ProjectModel project;
  final bool imageOnLeft;

  const ProjectShowcase({
    super.key,
    required this.project,
    this.imageOnLeft = true,
  });

  @override
  State<ProjectShowcase> createState() => _ProjectShowcaseState();
}

class _ProjectShowcaseState extends State<ProjectShowcase> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      precacheProjectImage(context);
    });
  }

  void precacheProjectImage(BuildContext context) {
    precacheImage(NetworkImage(widget.project.imageUrl), context);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isTablet =
            constraints.maxWidth <= 1200 && constraints.maxWidth >= 768;
        final isMobile = constraints.maxWidth < 768;

        return Container(
          constraints: const BoxConstraints(maxWidth: 1920),
          margin: EdgeInsets.symmetric(
            horizontal: _getHorizontalMargin(constraints.maxWidth),
            vertical: 16,
          ),
          decoration: BoxDecoration(
            color: ColorPalette.purple20,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: isMobile
              ? _buildMobileLayout(constraints)
              : _buildDesktopLayout(constraints, isTablet),
        );
      },
    );
  }

  double _getHorizontalMargin(double width) {
    if (width > 1200) return 64;
    if (width >= 768) return 32;
    return 16;
  }

  Widget _buildDesktopLayout(BoxConstraints constraints, bool isTablet) {
    final height = isTablet ? 600.0 : 500.0;
    final contentFlex = isTablet ? 3 : 2;
    final detailsFlex = isTablet ? 2 : 1;

    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (widget.imageOnLeft) ...[
            Expanded(
              flex: 2,
              child: _buildImage(false, constraints),
            ),
            Expanded(
              flex: contentFlex,
              child: _buildContent(false, constraints),
            ),
            Expanded(
              flex: detailsFlex,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(isTablet ? 12.0 : 16.0),
                  child: ProjectDetailsCard(
                    category: widget.project.projectCategory,
                    duration: widget.project.projectDuration,
                    country: widget.project.country,
                  ),
                ),
              ),
            ),
          ] else ...[
            Expanded(
              flex: detailsFlex,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(isTablet ? 12.0 : 16.0),
                  child: ProjectDetailsCard(
                    category: widget.project.projectCategory,
                    duration: widget.project.projectDuration,
                    country: widget.project.country,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: contentFlex,
              child: _buildContent(false, constraints),
            ),
            Expanded(
              flex: 2,
              child: _buildImage(false, constraints),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AspectRatio(
              aspectRatio: 16 / 9,
              child: _buildMobileImage(constraints),
            ),
            _buildContent(true, constraints),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ProjectDetailsCard(
                category: widget.project.projectCategory,
                duration: widget.project.projectDuration,
                country: widget.project.country,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileImage(BoxConstraints constraints) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: _buildNetworkImage(),
    );
  }

  Widget _buildImage(bool isMobile, BoxConstraints constraints) {
    return Container(
      margin: EdgeInsets.all(isMobile ? 12 : 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: ColorPalette.purple20,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (context, imageConstraints) {
          return Container(
            constraints: BoxConstraints(
              maxHeight: imageConstraints.maxHeight,
              maxWidth: imageConstraints.maxWidth,
            ),
            child: _buildNetworkImage(),
          );
        },
      ),
    );
  }

  Widget _buildNetworkImage() {
    return Image.network(
      widget.project.imageUrl,
      fit: BoxFit.contain,
      alignment: Alignment.center,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) {
          return Container(
            color: ColorPalette.purple10,
            child: child,
          );
        }
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
              const SizedBox(height: 8),
              Text(
                '${((loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)) * 100).toStringAsFixed(0)}%',
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: ColorPalette.purple20,
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error_outline, size: 40, color: Colors.red),
                SizedBox(height: 8),
                Text(
                  'Failed to load image',
                  style: TextStyle(color: Colors.red),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildContent(bool isMobile, BoxConstraints constraints) {
    final screenWidth = constraints.maxWidth;
    final padding = isMobile ? 16.0 : 24.0;

    return Padding(
      padding: EdgeInsets.all(padding),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.project.categories.length,
                itemBuilder: (context, index) {
                  return GreenText(label: widget.project.categories[index]);
                },
              ),
            ),
            SizedBox(height: isMobile ? 12 : 16),
            SelectableText(
              widget.project.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: _getResponsiveFontSize(screenWidth,
                    mobileSize: 22, tabletSize: 26, desktopSize: 30),
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: isMobile ? 8 : 12),
            SelectableText(
              widget.project.description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.9),
                fontSize: _getResponsiveFontSize(screenWidth,
                    mobileSize: 14, tabletSize: 15, desktopSize: 16),
                height: 1.5,
              ),
            ),
            SizedBox(height: isMobile ? 16 : 24),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(bottom: isMobile ? 12 : Sizes.size20),
                child: SectionButton(
                  label: "Visit Project",
                  onTap: () => AppUtils.openLinkInNewTab(widget.project.url),
                  isBlack: false,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  double _getResponsiveFontSize(
    double screenWidth, {
    required double mobileSize,
    required double tabletSize,
    required double desktopSize,
  }) {
    if (screenWidth > 1200) return desktopSize;
    if (screenWidth >= 768) return tabletSize;
    return mobileSize;
  }
}

class ProjectDetailsCard extends StatelessWidget {
  final String category;
  final String duration;
  final String country;

  const ProjectDetailsCard({
    super.key,
    required this.category,
    required this.duration,
    required this.country,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 768;
        final isTablet =
            constraints.maxWidth <= 1200 && constraints.maxWidth >= 768;

        return Container(
          padding: EdgeInsets.all(isMobile ? 16 : 20),
          decoration: BoxDecoration(
            color: ColorPalette.green,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildDetailRow(
                  'Project Category:', category, isMobile, isTablet),
              SizedBox(height: isMobile ? 12 : 16),
              _buildDetailRow('Duration:', duration, isMobile, isTablet),
              SizedBox(height: isMobile ? 12 : 16),
              _buildDetailRow('Country:', country, isMobile, isTablet),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDetailRow(
      String label, String value, bool isMobile, bool isTablet) {
    final labelSize = isMobile ? 14.0 : (isTablet ? 15.0 : 16.0);
    final valueSize = isMobile ? 16.0 : (isTablet ? 18.0 : 20.0);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: labelSize,
            color: Colors.black54,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: valueSize,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}
