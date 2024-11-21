import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/utils/app_utils.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/primary_button.dart';
import 'package:boris_ilic_portfolio/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../bloc/navigation_bloc.dart';
import 'app_bar_drawer_item.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: BlocBuilder<NavigationBloc, int>(
        buildWhen: (previous, current) => current != previous,
        builder: (context, state) {
          return Container(
            color: ColorPalette.purple,
            child: Padding(
              padding: const EdgeInsets.all(Sizes.size32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...pages.entries
                      .map((page) => MenuDrawerItem(
                            pageName: getPageName(context, page.key),
                            index: page.key,
                            isSelected: state == page.key,
                          ))
                      .toList(),
                  const Expanded(
                    child: SizedBox(),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: context.l.contactMe,
                      toUppercase: false,
                      onTap: () {
                        context.goNamed(AppRoutes.contactScreen);
                      },
                      isReverseColors: true,
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.size12,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      label: "Download CV",
                      toUppercase: false,
                      onTap: () {
                        AppUtils.downloadFirebaseFile("resume.pdf");
                      },
                      isReverseColors: true,
                    ),
                  ),
                  const SizedBox(
                    height: Sizes.size12,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      context.l.copyRight,
                      style: FontStyles.fontRegular14
                          .apply(color: ColorPalette.gray10),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
