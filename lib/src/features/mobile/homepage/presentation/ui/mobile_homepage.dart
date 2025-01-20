import 'dart:async';

import 'package:adzenproj/src/core/common/common_widgets.dart';
import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/core/resources/font_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/application/home_controller.dart';
import 'package:adzenproj/src/features/mobile/homepage/presentation/ui/widgets/dashboard_widgets/customer.dart';

import 'package:adzenproj/src/features/mobile/homepage/presentation/ui/widgets/dashboard_widgets/revenue.dart';
import 'package:adzenproj/src/features/mobile/homepage/presentation/ui/widgets/thumb_tabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/resources/gap_manager.dart';

class MobileHomepage extends ConsumerStatefulWidget {
  const MobileHomepage({super.key});

  @override
  ConsumerState<MobileHomepage> createState() => _MobileHomepageState();
}

class _MobileHomepageState extends ConsumerState<MobileHomepage> {

  @override
  void initState() {
    super.initState();

    // Delay the changeStatus call to ensure the widget builds first
    // before attempting to update the state.
    Future.delayed(Duration.zero, () {
      ref.read(mobileHomeController.notifier).changeStatus();
    });
  }

  @override
  Widget build(BuildContext context) {

    final controller = ref.watch(mobileHomeController).pageController;

    return Scaffold(
      backgroundColor: MyColors.grey,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 48.0, left: 4, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    logo(), // A sample logo
                    w10,
                    const Text(
                      'Dashboard',
                      style: mbh2,
                    ),
                  ],
                ),
                notificationButton(),
              ],
            ),
          ),
          h20,
          Expanded(
            child: GestureDetector(
              onPanUpdate: (drag) {
                // Detecting swipe gesture to change tab visibility.
                if (drag.delta.dx < 0) {
                  ref.read(mobileHomeController.notifier).changeStatus();
                }
              },
              child: Container(
                decoration: const BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(32)),
                ),
                child: Stack(
                  children: [
                    PageView(
                      pageSnapping: true,
                      scrollDirection: Axis.vertical,
                      controller: controller,
                      onPageChanged: (newIndex) {
                        // Changing the page index when a new page is selected.
                        ref.read(mobileHomeController.notifier).changeIndex(newIndex);
                        ref.read(mobileHomeController.notifier).changeStatus();
                      },
                      children: const [
                        RevenueMobile(),
                        CustomerMobile(),
                      ],
                    ),
                    const ThumbTabs() // Tab widget for switching between pages.
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
