import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/about/model/about_detail_model.dart';
import 'package:flutter/material.dart';

/// Displays a vertically scrollable list of services
class ServicesList extends StatelessWidget {
  final List<ServiceModel> services;

  static const double _spacing = 20.0;

  const ServicesList({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      separatorBuilder: (_, __) => const SizedBox(height: _spacing),
      itemBuilder: (_, index) => ServiceCard(service: services[index]),
    );
  }
}

/// Individual service card displaying service title and description
class ServiceCard extends StatelessWidget {
  final ServiceModel service;

  static const double _padding = 20.0;
  static const double _borderRadius = 12.0;
  static const double _iconSize = 24.0;
  static const double _spacing = 12.0;

  const ServiceCard({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(_padding),
      decoration: BoxDecoration(
        color: ColorPalette.purple20,
        borderRadius: BorderRadius.circular(_borderRadius),
        border: Border.all(color: ColorPalette.purple10, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.check_circle,
                color: Colors.green,
                size: _iconSize,
              ),
              const SizedBox(width: _spacing),
              Expanded(
                child: Text(
                  service.title,
                  style: FontStyles.fontRegular14.copyWith(
                    color: ColorPalette.white,
                    height: 1.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: _spacing),
          Text(
            service.description,
            style: FontStyles.fontRegular14.copyWith(
              color: ColorPalette.gray,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
