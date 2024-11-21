import 'package:boris_ilic_portfolio/features/localization/language.dart';
import 'package:boris_ilic_portfolio/repositories/shared_preference_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'localization_state.dart';

@injectable
class LocalizationBloc extends Cubit<LocalizationState> {
  final SharedPreferencesRepository _prefsServices;
  LocalizationBloc(this._prefsServices)
      : super(LocalizationState.initial(
            _prefsServices.getCurrentLocaleFromBrowser()));

  void init(BuildContext context) {
    String languageCode = _prefsServices.getCurrentLocaleFromBrowser();
    emit(state.copyWith(
        currentLanguage: Language.getLanguageBaseOnLanguageCode(languageCode)));
    //  MainApp.of(context).setLocale(Locale.fromSubtags(languageCode: languageCode));
  }

  void changeCurrentLocale(String languageCode, BuildContext context) {
    final locale = Locale.fromSubtags(languageCode: languageCode);
    _prefsServices.changeCurrentLocale(locale);
    emit(state.copyWith(
        currentLanguage: Language.getLanguageBaseOnLanguageCode(languageCode)));
    // MainApp.of(context).setLocale(locale);
  }
}
