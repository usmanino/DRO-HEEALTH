import 'package:dro/ui/landing/view/bottom.dart';
import 'package:flutter/material.dart';

class DROPages {
  /// The first page when the app loads

  static const String bottomnav = '/bottomnav';
}

///The main app routes logic using router generator
class AppRouter {
  ///list of all the app routes
  static Route route(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case DROPages.bottomnav:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const BottomNavBar();
          },
        );

      default:
        return MaterialPageRoute<Widget>(
          builder: (context) {
            return const Text('Error');
          },
        );
    }
  }
}
