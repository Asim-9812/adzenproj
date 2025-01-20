



import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/dashboard/presentation/ui/mobile_dashboard.dart';
import 'package:adzenproj/src/features/responsive/responsive_layout.dart';
import 'package:adzenproj/src/features/tablet/dashboard/presentation/ui/tablet_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // MediaQuery widget is used for the [textScaler] parameter
      // to ensure consistent UI scaling across different platforms.
      home: const MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.linear(1.0)),
        child: ResponsiveLayout(
            mobileBody: MobileDashboard(),
            tabBody: TabletDashboard()
        ),
      ),
      theme: ThemeData(
        // appBarTheme: AppBarTheme(
        //   systemOverlayStyle: SystemUiOverlayStyle(
        //     statusBarBrightness: Brightness.dark
        //   )
        // ),
          scaffoldBackgroundColor: MyColors.white,
          fontFamily: 'Inter'
      ),
    );
  }
}