import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/utils/app_utils.dart';
import 'package:boris_ilic_portfolio/global_components/buttons/primary_button.dart';
import 'package:boris_ilic_portfolio/helpers/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/navigation_bloc.dart';
import 'main_app_bar_item.dart';

class MainAppBar extends StatelessWidget implements PreferredSize {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, int>(
      listener: (context, state) {},
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        // var languageBloc = context.read<LocalizationBloc>();
        return Container(
          margin: const EdgeInsets.all(Sizes.size16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ...pages.entries
                  .map((page) => MainAppBarItem(
                        page: getPageName(context, page.key),
                        index: page.key,
                        isSelected: state == page.key,
                        onSelected: () {
                          context
                              .read<NavigationBloc>()
                              .changeTabIndex(page.key, context);
                        },
                      ))
                  .toList(),
              const Expanded(child: SizedBox()),
              SizedBox(
                width: 125,
                child: PrimaryButton(
                  label: "Download CV",
                  toUppercase: false,
                  onTap: () {
                    AppUtils.downloadFirebaseFile("resume.pdf");
                  },
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              PrimaryButton(
                label: context.l.contactMe,
                toUppercase: false,
                onTap: () => context.goNamed(AppRoutes.contactScreen),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(Sizes.size120);
}
