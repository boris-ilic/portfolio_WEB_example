import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/core/dependency_injection/di.dart';
import 'package:boris_ilic_portfolio/features/localization/bloc/localization_bloc.dart';
import 'package:boris_ilic_portfolio/features/navigation/bloc/navigation_bloc.dart';
import 'package:boris_ilic_portfolio/firebase_options.dart';
import 'package:boris_ilic_portfolio/helpers/bloc_observer.dart';
import 'package:boris_ilic_portfolio/helpers/responsive.dart';
import 'package:boris_ilic_portfolio/repositories/navigation_repository.dart';
import 'package:boris_ilic_portfolio/repositories/shared_preference_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/navigation/components/app_bar_drawer.dart';
import 'features/navigation/components/main_app_bar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies();
  // Initializing our navigation repo
  NavigationRepostory.instance;
  // shared preferences init for local storage in browser
  await SharedPreferencesRepository().init();

  // Observer to monitoring all bloc changes in console
  Bloc.observer = const AppBlocObserver();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(NavigationRepostory.instance)),
      BlocProvider<LocalizationBloc>(
        create: (context) => get<LocalizationBloc>()..init(context),
      ),
    ],
    child: const MainApp(),
  ));
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => MainAppState();

  static MainAppState of(BuildContext context) =>
      context.findAncestorStateOfType<MainAppState>()!;
}

class MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LocalizationBloc, LocalizationState>(
      builder: (context, state) {
        return ScreenUtilInit(
          designSize: const Size(1920, 1080),
          minTextAdapt: true,
          splitScreenMode: true,
          child: MaterialApp.router(
            title: "Boris Ilic portfolio",
            debugShowCheckedModeBanner: false,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale.fromSubtags(
                languageCode:
                    state.currentLanguage.languageCode), // default locale
            routerConfig: NavigationRepostory.router,
          ),
        );
      },
    );
  }
}

// need to separate context for localization

class MainScreen extends StatelessWidget {
  final Widget child;
  const MainScreen({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: ResponsiveWidget.isSmallScreen(context)
          ? AppBar(
              backgroundColor: ColorPalette.white,
              elevation: 0,
              iconTheme: const IconThemeData(color: ColorPalette.purple),
            )
          : const MainAppBar(),
      body: child,
    );
  }
}
