import 'package:daythree/features/auth/presentation/screens/RegisterScreen.dart';
import 'package:daythree/routes/AppRoutes.dart';
import 'package:flutter/material.dart';

import '../core/app/SplashScreen.dart';
import '../features/auth/presentation/screens/LoginScreen.dart';
import '../features/auth/presentation/screens/Onboard.dart';
import '../features/home/presentation/screens/HomeLayout.dart';

class RouteGenerator {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case AppRoutes.onboard:
        return MaterialPageRoute(builder: (_) => OnboardScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case AppRoutes.home:
        return MaterialPageRoute(builder: (_) => HomeLayout());
      default:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
    }
  }
}
