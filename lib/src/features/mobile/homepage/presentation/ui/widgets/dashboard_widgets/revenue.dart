import 'package:adzenproj/src/core/common/common_widgets.dart';
import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/application/home_controller.dart';
import 'package:adzenproj/src/core/common/charts_widgets/sample_line_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/common/charts_widgets/model/graph_model.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';

class RevenueMobile extends ConsumerWidget {
  const RevenueMobile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final dateFilters = ref.watch(mobileHomeController).dateFilters;
    final dateIndex = ref.watch(mobileHomeController).dateIndex;

    return Padding(
      padding: const EdgeInsets.all(16.0),

      // Added NotificationListener to detect scroll interactions,
      // as GestureDetector doesn't work inside SingleChildScrollView.
      // This workaround updates the status on scroll.
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // Handle scroll gestures to change tab visibility state
          if (scrollNotification is ScrollStartNotification ||
              scrollNotification is ScrollUpdateNotification) {
            ref.read(mobileHomeController.notifier).changeStatus();
          }
          return true; // Prevent further propagation of the notification
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Revenue', style: mbh2),
                  PopupMenuButton(
                    color: MyColors.white,
                    position: PopupMenuPosition.under,
                    itemBuilder: (context) {
                      // Create a menu for selecting different date filters
                      return dateFilters.map((e) => PopupMenuItem(
                        onTap: () {
                          final newIndex = dateFilters.indexOf(e);
                          ref.read(mobileHomeController.notifier).changeDateIndex(newIndex);
                        },
                        child: Text(e),
                      )).toList();
                    },
                    child: Row(
                      children: [
                        Text(dateFilters[dateIndex], style: mbs1),
                        const Icon(Icons.arrow_drop_down),
                      ],
                    ),
                  ),
                ],
              ),
              // Display the selected date range format
              Text(dateFormat(type: dateIndex)),
              const Divider(),
              h10,
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: MyColors.primaryColor,
                    child: Icon(Icons.currency_rupee, color: MyColors.white),
                  ),
                  w16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Revenue', style: mbh3),
                      Text('Rs. 850,000', style: mbh2),
                    ],
                  ),
                ],
              ),
              h20,
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: MyColors.white,
                    child: Icon(Icons.shopping_cart_rounded, color: MyColors.primaryColor),
                  ),
                  w16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Total Sales', style: mbr1),
                      Text('20,000 units', style: mbh3),
                    ],
                  ),
                ],
              ),
              h20,
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        backgroundColor: MyColors.white,
                        child: Icon(Icons.group, color: MyColors.primaryColor),
                      ),
                      w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('ARPC', style: mbs1),
                          Text('Rs. 30,000', style: mbr1),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Avg. Sales Rate', style: mbs1),
                      Row(
                        children: [
                          Text('12%', style: mbr1),
                          Icon(Icons.keyboard_arrow_down, color: MyColors.red),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              h20,
              const Divider(),
              h10,
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.line_axis, color: MyColors.primaryColor),
                  w16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Revenue Charts', style: mbh3),
                      Row(
                        children: [
                          Text('Realized', style: TextStyle(color: MyColors.primaryColor, fontSize: 12, fontWeight: FontWeight.normal)),
                          w04,
                          Text('vs', style: mbs1),
                          w04,
                          Text('Expected', style: TextStyle(color: MyColors.red, fontSize: 12, fontWeight: FontWeight.normal)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              h20,
              // Render the line chart with revenue data
              LineChartWidget(line1Data, line2Data),
              h100,
            ],
          ),
        ),
      ),
    );
  }
}
