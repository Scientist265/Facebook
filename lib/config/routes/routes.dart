import 'package:facebook_clo/core/screens/home_screen.dart';
import 'package:facebook_clo/features/auth/presentation/screens/create_account_screen.dart';
import 'package:facebook_clo/features/post/presentation/screen/create_post_screen.dart';
import 'package:flutter/cupertino.dart';

import '../../core/screens/error_screen.dart';

class Routes {
  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CreateAccountScreen.routeName:
        return _cupertinoRoute(const CreateAccountScreen());
      case HomeScreen.routeName:
        return _cupertinoRoute(const HomeScreen());
      case CreatePostScreen.routeName:
        return _cupertinoRoute(const CreatePostScreen());
      default:
        return _cupertinoRoute(
          ErrorScreen(
            error: 'Wrong Route provided ${settings.name}',
          ),
        );
    }
  }

  static Route _cupertinoRoute(Widget view) => CupertinoPageRoute(
        builder: (_) => view,
      );

  Routes._();
}
