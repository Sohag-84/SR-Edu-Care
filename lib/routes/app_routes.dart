class AppRoutes {
  static Route splash = Route(name: "Splash", path: "/");
  static Route bottomNav = Route(name: "Bottom Navbar", path: "/bottom-nav");
}

class Route {
  final String name;
  final String path;

  Route({required this.name, required this.path});
}
