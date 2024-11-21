import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';

class MainAppBarItem extends StatelessWidget {
  final String page;
  final int index;
  final bool isSelected;
  final void Function() onSelected;
  const MainAppBarItem(
      {super.key,
      required this.page,
      required this.index,
      required this.isSelected,
      required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelected(),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: Sizes.size18, vertical: Sizes.size12),
            child: Text(
              page,
              style: !isSelected
                  ? FontStyles.fontBold20.apply(color: ColorPalette.purple)
                  : FontStyles.fontBold20.apply(color: ColorPalette.green),
            ),
          ),
          Visibility(
            maintainAnimation: true,
            maintainState: true,
            maintainSize: true,
            visible: isSelected,
            child: Container(
              height: 4,
              width: 50,
              color: ColorPalette.purple,
            ),
          ),
        ],
      ),
    );
  }
}
