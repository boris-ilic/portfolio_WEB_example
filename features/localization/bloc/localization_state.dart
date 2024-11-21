part of 'localization_bloc.dart';

class LocalizationState extends Equatable {
  final Language currentLanguage;

  const LocalizationState({
    required this.currentLanguage,
  });

  factory LocalizationState.initial(String languageCode) {
    return LocalizationState(currentLanguage: Language.getLanguageBaseOnLanguageCode(languageCode));
  }

  LocalizationState copyWith({
    Language? currentLanguage,
  }) {
    return LocalizationState(
      currentLanguage: currentLanguage ?? this.currentLanguage,
    );
  }

  @override
  List<Object?> get props => [currentLanguage];
}
