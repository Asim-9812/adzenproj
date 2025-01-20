

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/common/charts_widgets/model/graph_model.dart';
import '../../../../../../../core/common/charts_widgets/sample_bar_charts.dart';
import '../../../../../../../core/common/common_widgets.dart';
import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';
import '../../../../application/home_controller.dart';

class TabCustomer extends ConsumerWidget {
  final bool isPortrait;
  const TabCustomer({required this.isPortrait,super.key});

  @override
  Widget build(BuildContext context, ref) {

    final dateFilters = ref.watch(tabHomeController).dateFilters;
    final dateIndex = ref.watch(tabHomeController).customerDateIndex;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: MyColors.grey,
              width: 4
          )
      ),
      width: double.infinity,
      constraints: const BoxConstraints(
        minHeight: 550
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                      ref.read(tabHomeController.notifier).changeCustomerDateIndex(newIndex);
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
          Text(dateFormat(type: dateIndex)),
          h10,
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // New customers card with icon and statistics
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            backgroundColor: MyColors.white,
                            child: Icon(Icons.groups, color: MyColors.primaryColor)),
                        w16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('New Customers', style: mbh3),  // Label for new customers
                              Text('250', style: mbh2),  // Value for new customers
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.keyboard_arrow_up, color: MyColors.green),  // Up arrow indicating growth
                        Text('4%', style: TextStyle(color: MyColors.green, fontSize: 12, fontWeight: FontWeight.normal)),
                        w04,
                        Expanded(child: Text('vs 240 prev month', style: mbs1)),  // Comparison with previous month
                      ],
                    ),
                  ],
                ),
              ),
              w10,
              // Customer lifetime value card with icon and statistics
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                            backgroundColor: MyColors.white,
                            child: Icon(Icons.people_alt_outlined, color: MyColors.primaryColor)),
                        w16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('CLV', style: mbh3),  // Label for customer lifetime value
                              Text('Rs. 3000', style: mbh2),  // Value for lifetime value

                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.keyboard_arrow_up, color: MyColors.green),  // Up arrow indicating growth
                        Text('7%', style: TextStyle(color: MyColors.green, fontSize: 12, fontWeight: FontWeight.normal)),
                        w04,
                        Expanded(child: Text('vs Rs. 2790 prev month', style: mbs1)),  // Comparison with previous month
                      ],
                    ),
                  ],
                ),
              ),

            ],
          ),
          h10,
          const Divider(),
          h20,
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
        ],
      ),
    );
  }
}
