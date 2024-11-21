
import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  /// Constructor
  final String label;
  final VoidCallback onTap;
  final Color? borderColor;
  final bool isEnabled;
  final bool toUppercase;
  final bool isReverseColors;

  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.isEnabled = true,
    this.toUppercase = true,
    this.borderColor,
    this.isReverseColors = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: TextButton(
        onPressed: isEnabled ? onTap : null,
        style: TextButton.styleFrom(
          backgroundColor: isEnabled
              ? (isReverseColors ? ColorPalette.green : ColorPalette.purple)
              : ColorPalette.gray30,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Sizes.size42),
            side: borderColor == null
                ? BorderSide.none
                : BorderSide(
                    color: borderColor!,
                  ),
          ),
          minimumSize: const Size.fromHeight(Sizes.size50),
        ),
        child: Text(
          toUppercase ? label.toUpperCase() : label,
          textAlign: TextAlign.center,
          style: isEnabled
              ? TextStyle(
                  color: isReverseColors ? ColorPalette.purple : ColorPalette.green,
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                )
              : const TextStyle(
                  color: ColorPalette.white,
                  fontWeight: FontWeight.w600,
                  fontSize: Sizes.size16,
                ),
        ),
      ),
    );
  }
}
