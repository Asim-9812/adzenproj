

import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/widgets/common_bar_widgets/appbar.dart';
import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/widgets/common_bar_widgets/profilebar.dart';
import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/widgets/dashboard_widgets/customer.dart';
import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/widgets/dashboard_widgets/operations.dart';
import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/widgets/dashboard_widgets/recent_activities.dart';
import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/widgets/dashboard_widgets/revenue.dart';
import 'package:flutter/material.dart';
import '../../../../../../core/resources/gap_manager.dart';

class TabPortraitHomepage extends StatelessWidget {
  const TabPortraitHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 16.0,right: 16,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DashboardBar(),
            h20,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileBar(),
                    h20,
                    TabRevenue(isPortrait: true),
                    h10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TabCustomer(isPortrait: true,),
                        ),
                        w10,
                        Expanded(
                          flex: 1,
                          child: RecentActivities(isPortrait: true),
                        ),
                      ],
                    ),
                    h10,
                    TabOperations(isPortrait: true),

                    h100,
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
