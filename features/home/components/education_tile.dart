import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/home/model/experience_model.dart';
import 'package:flutter/material.dart';

class EducationTile extends StatelessWidget {
  final ExperienceModel education;
  final bool isFirst;
  final bool isLast;

  const EducationTile({
    super.key,
    required this.education,
    this.isFirst = false,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildTimeline(),
            const SizedBox(width: 20),
            Expanded(child: _buildContent(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeline() {
    return Column(
      children: [
        if (!isFirst)
          Container(
            width: 2,
            height: 20,
            color: ColorPalette.purple,
          ),
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            border: Border.all(
              color: ColorPalette.purple,
              width: 3,
            ),
          ),
        ),
        if (!isLast)
          Expanded(
            child: Container(
              width: 2,
              color: ColorPalette.purple,
            ),
          ),
      ],
    );
  }

  Widget _buildContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildDurationChip(),
          const SizedBox(height: 12),
          _buildSchoolName(),
          const SizedBox(height: 8),
          _buildDegree(),
          if (education.description.isNotEmpty) ...[
            const SizedBox(height: 8),
            _buildDescription(),
          ],
          if (education.technologies.isNotEmpty) ...[
            const SizedBox(height: 12),
            _buildTechnologies(),
          ],
        ],
      ),
    );
  }

  Widget _buildDurationChip() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: ColorPalette.purple.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        education.duration,
        style: FontStyles.fontRegular14.copyWith(color: ColorPalette.purple),
      ),
    );
  }

  Widget _buildSchoolName() {
    return Text(
      education.title,
      style: FontStyles.fontRegular14.copyWith(
        color: Colors.black87,
        height: 1.2,
      ),
    );
  }

  Widget _buildDegree() {
    return Text(
      education.subTitle,
      style: FontStyles.fontRegular14.copyWith(
        color: Colors.black54,
        height: 1.2,
      ),
    );
  }

  Widget _buildDescription() {
    return Text(
      education.description,
      style: FontStyles.fontRegular14.copyWith(
        color: ColorPalette.purple,
        height: 1.2,
      ),
    );
  }

  Widget _buildTechnologies() {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: education.technologies.map((tech) {
        return Chip(
          label: Text(
            tech,
            style:
                FontStyles.fontRegular14.copyWith(color: Colors.grey.shade700),
          ),
          backgroundColor: Colors.grey.shade100,
          padding: const EdgeInsets.all(4),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        );
      }).toList(),
    );
  }
}
