


import 'package:adzenproj/src/features/tablet/dashboard/presentation/ui/landscape_widget/tab_landscape_dashboard.dart';
import 'package:adzenproj/src/features/tablet/dashboard/presentation/ui/potrait_widget/tab_potrait_dashboard.dart';
import 'package:flutter/material.dart';

class TabletDashboard extends StatelessWidget {
  const TabletDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, orientation){
          return orientation == Orientation.portrait ? const TabPotraitDashboard() : const TabLandscapeDashboard();
        }
    );
  }
}
