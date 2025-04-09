import 'package:daythree/features/home/presentation/screens/HomeLayout.dart';
import 'package:daythree/routes/AppRoutes.dart';
import 'package:daythree/routes/RouteGenerator.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.splash,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
