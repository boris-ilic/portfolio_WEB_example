import 'package:boris_ilic_portfolio/constants/assets/image_constants.dart';
import 'package:boris_ilic_portfolio/helpers/extensions.dart';
import 'package:flutter/material.dart';

class Language {
  final int id;
  final String name;
  final String flag;
  final String languageCode;

  const Language({
    required this.id,
    required this.name,
    required this.flag,
    required this.languageCode,
  });

  static List<Language> languageList = <Language>[
    Language(id: 1, name: "English", flag: AppImages.usFlag, languageCode: "en"),
    Language(id: 2, name: "Serbian", flag: AppImages.serbianFlag, languageCode: "sr")
  ];

  static Language getLanguageBaseOnLanguageCode(String languageCode) {
    return Language.languageList.firstWhere((lang) => lang.languageCode == languageCode);
  }

  static String getLanguageNameLocalized(BuildContext context, String languageCode) {
    switch (languageCode) {
      case "en":
        return context.l.english;
      case "sr":
        return context.l.serbian;
      default:
        return context.l.english;
    }
  }
}
