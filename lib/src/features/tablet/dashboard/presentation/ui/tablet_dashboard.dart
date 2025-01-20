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
      body: SafeArea(
        child: Padding(
          // To display under the status bar of the device since
          // in few devices the SafeArea widget is not working properly.
          padding: const EdgeInsets.only(top: 32.0),
          child: Row(
            children: [
              const SideBar(),
              Expanded(
                child: PageView(
                  controller: controller,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    TabHomepage(),
                    TabProfilePage()
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
