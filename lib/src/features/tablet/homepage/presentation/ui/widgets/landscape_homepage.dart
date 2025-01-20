

import 'package:flutter/material.dart';

import '../../../../../../core/resources/gap_manager.dart';
import 'common_bar_widgets/appbar.dart';
import 'common_bar_widgets/profilebar.dart';
import 'dashboard_widgets/customer.dart';
import 'dashboard_widgets/operations.dart';
import 'dashboard_widgets/recent_activities.dart';
import 'dashboard_widgets/revenue.dart';

class TabLandscapeHomepage extends StatelessWidget {
  const TabLandscapeHomepage({super.key});

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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // A bool condition is given for consistent height
                        // the widgets when in portrait or landscape.
                        Expanded(
                          flex: 2,
                          child: TabRevenue(isPortrait: false),
                        ),
                        w10,
                        Expanded(
                          flex: 1,
                          child: RecentActivities(isPortrait: false),
                        ),
                      ],
                    ),
                    h10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: TabCustomer(isPortrait: false,),
                        ),
                        w10,
                        Expanded(
                          flex: 3,
                          child: TabOperations(isPortrait: false),
                        ),
                      ],
                    ),


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
