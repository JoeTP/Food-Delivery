import 'package:daythree/core/constants/strings.dart';
import 'package:daythree/core/local/shared_pref/SharedPrefHelper.dart';
import 'package:daythree/routes/AppRoutes.dart';
import 'package:daythree/routes/RouteGenerator.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  SharedPrefHelper prefs = SharedPrefHelper();

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
        initialRoute:
            prefs.getBool(AppConst.ISLOGGED) ?? false
                ? AppRoutes.home
                : AppRoutes.onboard,
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
