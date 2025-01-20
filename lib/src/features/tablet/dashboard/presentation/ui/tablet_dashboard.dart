import 'package:adzenproj/src/features/tablet/dashboard/application/dashboard_controller.dart';
import 'package:adzenproj/src/features/tablet/homepage/presentation/ui/tab_homepage.dart';
import 'package:adzenproj/src/features/tablet/profile_page/presentation/ui/tab_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'common_dashboard_widgets/common_bar_widgets/sidebar.dart';


class TabletDashboard extends ConsumerWidget {
  const TabletDashboard({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final controller = ref.watch(tabDashboardController).pageController;
    return Scaffold(
      body: Row(
        children: [
          const SideBar(),
          Expanded(
            child: PageView(
              controller: controller,
              physics: NeverScrollableScrollPhysics(),
              children: [
                TabHomepage(),
                TabProfilePage()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
