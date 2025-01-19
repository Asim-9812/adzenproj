



import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/dashboard/presentation/ui/mobile_dashboard.dart';
import 'package:adzenproj/src/features/responsive/responsive_layout.dart';
import 'package:adzenproj/src/features/tablet/dashboard/presentation/ui/tablet_dashboard.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MediaQuery(
        data: MediaQueryData(textScaler: TextScaler.linear(1.0)),
        child: ResponsiveLayout(
            mobileBody: MobileDashboard(),
            tabBody: TabletDashboard()
        ),
      ),
      theme: ThemeData(
          scaffoldBackgroundColor: MyColors.white,
        fontFamily: 'Inter'
      ),
    );
  }
}