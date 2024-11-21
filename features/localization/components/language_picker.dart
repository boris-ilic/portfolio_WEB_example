import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/localization/language.dart';
import 'package:flutter/material.dart';

class LanguagePickerWidget extends StatelessWidget {
  final void Function(Language) onSelected;
  final Language currentLanguage;
  final bool isSmallMenu;

  const LanguagePickerWidget({
    Key? key,
    required this.onSelected,
    required this.currentLanguage,
    required this.isSmallMenu,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: Sizes.size42),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            enableFeedback: true,
            hint: Text(
              Language.getLanguageNameLocalized(
                  context, currentLanguage.languageCode),
              style: FontStyles.fontBoldPurple16.apply(
                color: isSmallMenu ? ColorPalette.green : ColorPalette.purple,
              ),
            ),
            style: FontStyles.fontBoldPurple16.apply(
              color: isSmallMenu ? ColorPalette.green : ColorPalette.purple,
            ),
            focusColor: ColorPalette.transparent,
            dropdownColor:
                isSmallMenu ? ColorPalette.purple : ColorPalette.lightGreen,
            items: Language.languageList
                .map<DropdownMenuItem<Language>>((lang) => DropdownMenuItem(
                      value: lang,
                      child: Row(children: [
                        Text(
                          Language.getLanguageNameLocalized(
                              context, lang.languageCode),
                          style: FontStyles.fontBoldPurple16.apply(
                            color: isSmallMenu
                                ? ColorPalette.green
                                : ColorPalette.purple,
                          ),
                        ),
                      ]),
                    ))
                .toList(),
            // icon: Image.asset(currentLanguage.flag, height: Sizes.size24),
            onChanged: (Language? language) {
              if (language != null) {
                onSelected(language);
              }
            }),
      ),
    );
  }
}
