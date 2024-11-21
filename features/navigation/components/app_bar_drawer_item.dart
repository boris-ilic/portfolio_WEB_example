import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/navigation_bloc.dart';

class MenuDrawerItem extends StatelessWidget {
  final String pageName;
  final int index;
  final bool isSelected;
  const MenuDrawerItem(
      {super.key,
      required this.pageName,
      required this.index,
      required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read<NavigationBloc>().changeTabIndex(index, context);
      },
      child: Column(
        children: [
          Text(
            pageName,
            style: FontStyles.fontRegular14.apply(
              color: isSelected ? Colors.white : ColorPalette.green,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: Sizes.size8, bottom: Sizes.size8),
            child: Divider(
              color: ColorPalette.green,
              thickness: 2,
            ),
          ),
        ],
      ),
    );
  }
}
