# Boris Ilic WEB Flutter Example


## 🌟 Features

- 📱 Responsive design that works across all devices
- 🎯 Clean Architecture with feature-first approach
- 🔥 Firebase integration for dynamic content management
- 📝 Medium blog integration
- 🚀 Performance optimized
- 🌐 Go Router for efficient navigation
- 💉 Dependency Injection using Injectable
- 🎨 Modern UI with custom animations

## 🛠️ Tech Stack

- **Framework**: Flutter (SDK ≥3.2.0)
- **State Management**: Flutter Bloc/Cubit
- **Navigation**: Go Router
- **Backend**: Firebase (Auth, Firestore, Storage)
- **API Integration**: Dio
- **Dependency Injection**: Injectable/Get_it
- **Blog Integration**: Medium API
- **Localization**: Flutter Localizations
- **Asset Management**: Flutter Gen

## 📂 Project Structure

```
lib/
├── core/
│   ├── base/
│   ├── dependency_injection/
│   ├── error/
│   └── utils/
├── features/
│   ├── about/
│   ├── blog/
│   ├── contact/
│   ├── home/
│   ├── localization/
│   ├── navigation/
│   ├── project/
│   └── service/
├── global_components/
├── helpers/
├── l10n/
├── repositories/
└── theme/
```

## 🚀 Key Features

### 1. Home Section

- Professional introduction
- Work experience timeline
- Education history
- Testimonials

### 2. Project Showcase

- Portfolio of completed projects
- Project descriptions and technologies used
- Live demo links

### 3. Services Section

- Mobile Development
- Web Development
- Full IT Support
- Interview Support
- Consultancy Services

### 4. Blog Integration

- Medium feed integration
- Latest articles display
- Dynamic content updates

### 5. About Section

- Professional background
- Skills and expertise
- Service offerings

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  flutter_localizations:
    sdk: flutter

  # State Management
  flutter_bloc: ^8.1.5
  equatable: ^2.0.5
  rxdart: ^0.27.7

  # Routing
  go_router: ^13.2.4

  # Firebase
  firebase_core: ^3.2.0
  firebase_auth: ^5.1.2
  firebase_storage: ^12.1.2
  cloud_firestore: ^latest

  # Dependency Injection
  injectable: ^2.4.2
  get_it: ^latest

  # UI Components
  flutter_svg: ^2.0.10+1
  flutter_screenutil: ^5.9.3
  flutter_widget_from_html: ^0.15.2

  # API & Network
  dio: ^5.5.0+1
  pretty_dio_logger: ^1.4.0

  # Storage
  shared_preferences: ^2.2.2

  # Utilities
  email_validator: ^2.1.17
  intl: any
  url_launcher: ^6.2.6
  recase: ^latest
  universal_html: ^latest

  # Code Generation
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

dev_dependencies:
  flutter_test:
    sdk: flutter

  # Linting & Analysis
  flutter_lints: ^2.0.0

  # Code Generation
  build_runner: ^2.4.11
  freezed: ^2.5.2
  json_serializable: ^6.8.0
  flutter_gen_runner: ^5.6.0
  injectable_generator: ^latest

flutter:
  generate: true
  uses-material-design: true

  assets:
    - assets/images/
    - assets/icons/
    - assets/pdf/
```

## 🔧 Setup & Installation

1. Clone the repository

   ```bash
   git clone https://github.com/boris-ilic/portfolio_site
   ```

2. Install dependencies

   ```bash
   flutter pub get
   ```

3. Configure Firebase

   - Create a new Firebase project
   - Add Firebase configuration files
   - Enable necessary Firebase services

4. Run the app
   ```bash
   flutter run -d chrome
   ```

## 📦 Dependencies & Development Setup

### FVM Integration

This project uses Flutter Version Management (FVM) to ensure consistent Flutter SDK versions across development environments.

To set up FVM:

1. Install FVM:

   ```bash
   dart pub global activate fvm
   ```

2. Install project Flutter version:
   ```bash
   fvm install
   ```
3. Use FVM version:
   ```bash
   fvm use
   ```

# 🌐 Localization

The project uses Flutter's built-in localization system with `flutter_localizations` and `intl`. The implementation follows a BLoC pattern for managing language state.

## Setup

### 1. Dependencies
```yaml
dependencies:
  flutter_localizations:
    sdk: flutter
  intl: any
```

### 2. Structure
```
lib/
├── l10n/
│   ├── app_en.arb
│   └── app_sr.arb
├── features/
│   └── localization/
│       ├── bloc/
│       │   ├── localization_bloc.dart
│       │   └── localization_state.dart
│       └── language.dart
```

### 3. Generate Localization Files

Add to `pubspec.yaml`:
```yaml
flutter:
  generate: true
```

## Adding New Languages

1. Create a new ARB file in the `l10n` directory (e.g., `app_fr.arb`):
```json
{
    "welcomeMessage": "Bonjour!",
    "@welcomeMessage": {
        "description": "Welcome message shown on home screen"
    }
}
```

2. Update `Language` enum in `language.dart`:
```dart
enum Language {
  english('en', 'English'),
  german('de', 'Deutsch'),
  serbian('sr', 'Српски'),
  french('fr', 'Français'); // New language

  final String languageCode;
  final String displayName;

  const Language(this.languageCode, this.displayName);

  static Language getLanguageBaseOnLanguageCode(String languageCode) {
    return Language.values.firstWhere(
      (element) => element.languageCode == languageCode,
      orElse: () => Language.english,
    );
  }
}
```

## Usage

### Switch Language
```dart
context.read<LocalizationBloc>().changeCurrentLocale('fr', context);
```

### Access Translations
```dart
Text(AppLocalizations.of(context)!.welcomeMessage)
```

## Adding New Translation Keys

1. Add new key to `app_en.arb` (base language):
```json
{
    "welcomeMessage": "Hello!",
    "@welcomeMessage": {
        "description": "Welcome message shown on home screen"
    },
    "newKey": "New translation",
    "@newKey": {
        "description": "Description of the new translation key"
    }
}
```

2. Add the same key to other language files (`app_de.arb`, `app_sr.arb`, etc.):
```json
{
    "newKey": "Neue Übersetzung"  // German translation
}
```

3. Run generation command:
```bash
flutter gen-l10n
```

## Implementation Details

### State Management (BLoC)
```dart
@injectable
class LocalizationBloc extends Cubit<LocalizationState> {
  final SharedPreferencesRepository _prefsServices;
  
  LocalizationBloc(this._prefsServices)
      : super(LocalizationState.initial(
            _prefsServices.getCurrentLocaleFromBrowser()));

  void changeCurrentLocale(String languageCode, BuildContext context) {
    final locale = Locale.fromSubtags(languageCode: languageCode);
    _prefsServices.changeCurrentLocale(locale);
    emit(state.copyWith(
        currentLanguage: Language.getLanguageBaseOnLanguageCode(languageCode)));
  }
}
```

### MaterialApp Integration
```dart
MaterialApp.router(
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  locale: Locale.fromSubtags(
      languageCode: state.currentLanguage.languageCode),
  // ... other configurations
)
```

### Persistence
```dart
class SharedPreferencesRepository {
  static const String localeKey = 'locale';

  Future<void> changeCurrentLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(localeKey, locale.languageCode);
  }

  String getCurrentLocaleFromBrowser() {
    // Implementation for getting current locale
    return 'en'; // Default to English
  }
}
```

## Quick Start
1. Ensure all dependencies are added to `pubspec.yaml`
2. Create ARB files for your supported languages in `l10n` directory
3. Run `flutter gen-l10n` to generate localization files
4. Initialize `LocalizationBloc` in your app
5. Use `AppLocalizations.of(context)` to access translations

For more details about Flutter localization, visit the [official documentation](https://docs.flutter.dev/development/accessibility-and-localization/internationalization).

## 🏗️ Architecture

The project follows a clean architecture approach with:

- **Feature-First Structure**: Each feature is self-contained with its own models, screens, and business logic
- **Repository Pattern**: Clear separation of data sources and business logic
- **Cubit State Management**: Predictable state management using Cubit pattern
- **Dependency Injection**: Clean dependency management using Injectable
- **Navigation**: Centralized routing using Go Router

## 💡 State Management

Using a custom `BaseAsyncCubit` for consistent state handling across features:

```dart
abstract class BaseAsyncCubit<T> extends Cubit<AsyncValue<T>> {
  BaseAsyncCubit() : super(const AsyncValue.initial());

  Future<void> runguarded(Future<T> Function() future) async {
    try {
      emit(AsyncValue.data(data: await future()));
    } catch (e) {
      emit(AsyncValue.error(
        data: state.data,
        message: e.toString(),
        statusCode: 1,
      ));
    }
  }
}
```

## 📱 Responsive Design

The application is fully responsive and works seamlessly across:

- Desktop browsers
- Tablets
- Mobile devices

## 🔥 Firebase Integration

The application leverages Firebase for:

- **Firestore**: Dynamic content management
- **Storage**: Asset management
- **Real-time updates**: Live content synchronization

## 🌍 API Integration

- **Medium API**: Integration for blog content
- **Error Handling**: Robust error management
- **Caching**: Efficient data management

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check [issues page](https://github.com/boris-ilic/boris_ilic_portfolio/issues).

## 📝 License

This project is [MIT](LICENSE) licensed.

## 📞 Contact

Boris Ilic - [ilicborisdev@gmail.com](mailto:ilicborisdev@gmail.com)

Project Link: [https://github.com/boris-ilic/portfolio_site](https://github.com/boris-ilic/portfolio_site)

---

⭐️ From [Boris Ilic](https://github.com/boris-ilic)
