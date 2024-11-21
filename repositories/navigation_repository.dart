//NOTE GoRouter some important things
// pushNamed vs goNamed (https://codewithandrea.com/articles/flutter-navigation-gorouter-go-vs-push/)
// pushNamed just add new page to stack, redirect to that new page, but URL remain the same
// goNamed remove existing page from stack, add new page to stack, redirect to new page, but URL is new one (highly recommended)
// builder vs page builder -> is the same thing, but pageBuilder require exp. MaterialPage withc provide you opportunity to create custom transition
// full guide of go router https://medium.com/flutter-community/integrating-bottom-navigation-with-go-router-in-flutter-c4ec388da16a

import 'package:boris_ilic_portfolio/constants/constants.dart';
import 'package:boris_ilic_portfolio/features/about/about_screen.dart';
import 'package:boris_ilic_portfolio/features/blog/blog_screen.dart';
import 'package:boris_ilic_portfolio/features/contact/contact_screen.dart';
import 'package:boris_ilic_portfolio/features/home/home_screen.dart';
import 'package:boris_ilic_portfolio/features/project/project_screen.dart';
import 'package:boris_ilic_portfolio/features/service/service_screen.dart';
import 'package:boris_ilic_portfolio/main.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavigationRepostory {
  static late final GoRouter router;
  static final GlobalKey<NavigatorState> _rootNavigatorKey =
      GlobalKey<NavigatorState>();

  static final NavigationRepostory _instance = NavigationRepostory._internal();

  static NavigationRepostory get instance => _instance;

  factory NavigationRepostory() {
    return _instance;
  }

  static String getPath(String routeName) => "/$routeName";

  static Page getPage({
    required Widget child,
    required GoRouterState state,
  }) {
    return MaterialPage(
      key: state.pageKey,
      child: child,
    );
  }

  void goToScreenFromMenu(int screenIndex, BuildContext context) {
    switch (screenIndex) {
      case 0:
        context.goNamed(AppRoutes.homeScreen);
        break;
      case 1:
        context.goNamed(AppRoutes.servicesScreen);
        break;

      case 3:
        context.goNamed(AppRoutes.projectScreen);
        break;

      case 4:
        context.goNamed(AppRoutes.blogScreen);
        break;
      default:
        context.goNamed(AppRoutes.homeScreen);
        break;
    }
  }

  NavigationRepostory._internal() {
    // Router initialization happens here.
    router = GoRouter(
        initialLocation: AppRoutes.homeScreen,
        navigatorKey: _rootNavigatorKey,
        routes: getRoutes(),
        errorPageBuilder: (context, state) {
          return getPage(child: Container(), state: state);
        });
  }

  static List<RouteBase> getRoutes() {
    return [
      GoRoute(
        path: getPath(AppRoutes.contactScreen),
        name: AppRoutes.contactScreen,
        builder: (context, state) => ContactScreen(key: state.pageKey),
      ),
      ShellRoute(
          parentNavigatorKey: _rootNavigatorKey,
          builder: (context, state, child) => MainScreen(
                key: state.pageKey,
                child: child,
              ),
          routes: [
            GoRoute(
              path: AppRoutes.homeScreen,
              name: AppRoutes.homeScreen,
              pageBuilder: (context, state) =>
                  getPage(child: const HomeScreen(), state: state),
            ),
            GoRoute(
              path: getPath(AppRoutes.servicesScreen),
              name: AppRoutes.servicesScreen,
              pageBuilder: (context, state) =>
                  getPage(child:  const ServiceScreen(), state: state),
            ),
            GoRoute(
              path: getPath(AppRoutes.aboutScreen),
              name: AppRoutes.aboutScreen,
              pageBuilder: (context, state) =>
                  getPage(child: const AboutSection(), state: state),
            ),
            GoRoute(
              path: getPath(AppRoutes.projectScreen),
              name: AppRoutes.projectScreen,
              pageBuilder: (context, state) =>
                  getPage(child: const ProjectScreen(), state: state),
            ),
            GoRoute(
              path: getPath(AppRoutes.blogScreen),
              name: AppRoutes.blogScreen,
              pageBuilder: (context, state) =>
                  getPage(child: const BlogScreen(), state: state),
            ),
          ]),
    ];
  }
}
