


import 'package:adzenproj/src/core/common/common_widgets.dart';
import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/application/home_controller.dart';
import 'package:adzenproj/src/core/common/charts_widgets/sample_bar_charts.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/common/charts_widgets/model/graph_model.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';

class CustomerMobile extends ConsumerWidget {
  const CustomerMobile({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final dateFilters = ref.watch(mobileHomeController).dateFilters;  // Date filter options
    final dateIndex = ref.watch(mobileHomeController).dateIndex;  // Current selected date filter

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          // Added NotificationListener to detect scroll interactions,
          // as GestureDetector doesn't work inside SingleChildScrollView.
          // This workaround updates the status on scroll.
          if (scrollNotification is ScrollStartNotification ||
              scrollNotification is ScrollUpdateNotification) {
            // Handle scroll events to update visibility status
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
                  const Text('Customers', style: mbh2),  // Section title
                  PopupMenuButton(
                    color: MyColors.white,
                    position: PopupMenuPosition.under,
                    itemBuilder: (context) {
                      // Generate date filter menu items
                      return dateFilters.map((e) => PopupMenuItem(
                        onTap: () {
                          // Change the selected date filter
                          final newIndex = dateFilters.indexOf(e);
                          ref.read(mobileHomeController.notifier).changeDateIndex(newIndex);
                        },
                        child: Text(e),
                      )).toList();
                    },
                    child: Row(
                      children: [
                        Text(dateFilters[dateIndex], style: mbs1),  // Current selected date filter
                        const Icon(Icons.arrow_drop_down),  // Dropdown arrow
                      ],
                    ),
                  ),
                ],
              ),
              Text(dateFormat(type: dateIndex)),  // Display formatted date
              const Divider(),  // Divider between sections
              h10,
              // New customers card with icon and statistics
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundColor: MyColors.white,
                      child: Icon(Icons.groups, color: MyColors.primaryColor)),
                  w16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('New Customers', style: mbh3),  // Label for new customers
                      Text('250', style: mbh2),  // Value for new customers
                      Row(
                        children: [
                          Icon(Icons.keyboard_arrow_up, color: MyColors.green),  // Up arrow indicating growth
                          Text('4%', style: TextStyle(color: MyColors.green, fontSize: 12, fontWeight: FontWeight.normal)),
                          w04,
                          Text('vs 240 prev month', style: mbs1),  // Comparison with previous month
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              h20,
              // Customer lifetime value card with icon and statistics
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                      backgroundColor: MyColors.white,
                      child: Icon(Icons.people_alt_outlined, color: MyColors.primaryColor)),
                  w16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Customer Lifetime Value', style: mbr1),  // Label for customer lifetime value
                      Text('Rs. 3000', style: mbh3),  // Value for lifetime value
                      Row(
                        children: [
                          Icon(Icons.keyboard_arrow_up, color: MyColors.green),  // Up arrow indicating growth
                          Text('7%', style: TextStyle(color: MyColors.green, fontSize: 12, fontWeight: FontWeight.normal)),
                          w04,
                          Text('vs Rs. 2790 prev month', style: mbs1),  // Comparison with previous month
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              h20,
              const Divider(),  // Divider between sections
              h10,
              // Customer statistics card with chart
              const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.line_axis, color: MyColors.primaryColor),  // Icon for customer statistics
                  w16,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Customer Statistics', style: mbh3),  // Label for customer statistics
                      Row(
                        children: [
                          Text('New Customers', style: TextStyle(color: MyColors.primaryColor, fontSize: 12, fontWeight: FontWeight.normal)),
                          w04,
                          Text('per month', style: mbs1),  // Unit for new customers
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              h20,
              BarChartWidget(barData),  // Bar chart widget displaying statistics
              h100,  // Padding at the bottom
            ],
          ),
        ),
      ),
    );
  }
}

