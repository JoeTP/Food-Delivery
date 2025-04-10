import 'package:daythree/features/home/presentation/screens/HomeLayout.dart';
import 'package:daythree/routes/AppRoutes.dart';
import 'package:daythree/routes/RouteGenerator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),
      builder: (context, child) => child!,

      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        initialRoute: AppRoutes.home,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
