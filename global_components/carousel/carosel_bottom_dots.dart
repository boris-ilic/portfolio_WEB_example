import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/widgets.dart';

class CarouselBottomDots extends StatelessWidget {
  final int rectangleNumber;
  final int currentRectangle;
  final double rectangleSize = Sizes.size20;
  final Function(int) onRectangleTapped;

  const CarouselBottomDots(
      {super.key, required this.rectangleNumber,
      required this.currentRectangle,
      required this.onRectangleTapped});

  @override
  Widget build(BuildContext context) {
    // Implement the UI representation of the page indicators
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: Iterable.generate(rectangleNumber).map((i) {
        // Create the individual rectangle indicator with GestureDetector for tapping
        return Container(
          padding: const EdgeInsets.all(Sizes.size6),
          child: Container(
            height: rectangleSize,
            width: rectangleSize,
            decoration: BoxDecoration(
                color: (i == currentRectangle) ? ColorPalette.purple10 : ColorPalette.purple,
                shape: BoxShape.circle),
            child: GestureDetector(
              onTap: () => onRectangleTapped(i),
            ),
          ),
        );
      }).toList(),
    );
  }
}
