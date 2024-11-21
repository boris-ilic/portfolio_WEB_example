part of constants;

abstract class AppRoutes {
  static const homeScreen = "/";
  static const servicesScreen = "services";
  static const aboutScreen = "about";
  static const projectScreen = "project";
  static const blogScreen = "blog";
  static const contactScreen = "contact";
}

const Map<int, String> pages = {
  0: "Home",
  1: "Services",
  3: "Projects",
  4: "Blogs",
};

String getPageName(BuildContext context, int index) {
  switch (index) {
    case 0:
      return context.l.home;
    case 1:
      return context.l.services;

    case 3:
      return context.l.projects;
    case 4:
      return context.l.blogs;

    default:
      return context.l.home;
  }
}
