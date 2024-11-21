import 'package:flutter/material.dart';
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/home/model/testimonial_model.dart';

class TestimonialCard extends StatelessWidget {
  final TestimonialModel testimonial;

  const TestimonialCard({Key? key, required this.testimonial})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width / 2,
        padding: const EdgeInsets.all(Sizes.size10),
        decoration: _buildCardDecoration(),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildAvatar(),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildNameAndPosition(),
                    const SizedBox(height: Sizes.size10),
                    _buildRecommendation(),
                    const SizedBox(height: Sizes.size10),
                    _buildRating(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _buildCardDecoration() {
    return BoxDecoration(
      color: ColorPalette.gray,
      borderRadius: BorderRadius.circular(Sizes.size12),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          blurRadius: 10,
          offset: const Offset(0, 4),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Expanded(
      flex: 1,
      child: Image.network(
        testimonial.avatar,
        errorBuilder: (context, error, stackTrace) => const CircleAvatar(
          radius: Sizes.size50,
          child: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _buildNameAndPosition() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          testimonial.displayName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          testimonial.position,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Widget _buildRecommendation() {
    return Text(
      testimonial.recommendation,
      style: FontStyles.fontRegular14.copyWith(color: ColorPalette.black),
    );
  }

  Widget _buildRating() {
    return Row(
      children: [
        ...List.generate(
          5,
          (index) => const Icon(Icons.star, color: Colors.amber),
        ),
        const SizedBox(width: Sizes.size10),
        const Text(
          '5.0',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
