import 'package:flutter/material.dart';

class BusinessCardWidget extends StatelessWidget {
  final String logoImage;
  final String qrCodeImage;

  const BusinessCardWidget({
    super.key,
    required this.logoImage,
    required this.qrCodeImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          radius: 30,
          backgroundImage: AssetImage(logoImage),
        ),
        const SizedBox(height: 8),
        Image.asset(
          qrCodeImage,
          width: 100,
          height: 100,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
