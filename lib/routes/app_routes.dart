class AppRoutes {
  static Route splash = Route(name: "Splash", path: "/");
  static Route login = Route(name: "Login", path: "/login");
  static Route register = Route(name: "Register", path: "/register");
  static Route bottomNav = Route(name: "Bottom Navbar", path: "/bottom-nav");
  static Route home = Route(name: "Home", path: "/home");
  static Route wishlist = Route(name: "Wishlist", path: "/wishlist");
  static Route myCourse = Route(name: "My Course", path: "/my-course");
  static Route profile = Route(name: "Profile", path: "/profile");
  static Route course = Route(name: "Course", path: "/course");
}

class Route {
  final String name;
  final String path;

  Route({required this.name, required this.path});
}
