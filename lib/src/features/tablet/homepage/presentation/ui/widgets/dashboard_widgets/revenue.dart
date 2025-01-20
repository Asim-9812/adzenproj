

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/common/charts_widgets/model/graph_model.dart';
import '../../../../../../../core/common/charts_widgets/sample_line_chart.dart';
import '../../../../../../../core/common/common_widgets.dart';
import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';
import '../../../../application/home_controller.dart';

class TabRevenue extends ConsumerWidget {
  final bool isPortrait;
  const TabRevenue({required this.isPortrait,super.key});

  @override
  Widget build(BuildContext context, ref) {

    final dateFilters = ref.watch(tabHomeController).dateFilters;
    final dateIndex = ref.watch(tabHomeController).revenueDateIndex;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: MyColors.grey,
              width: 4
          )
      ),
      width: double.infinity,
      constraints: BoxConstraints(
          minHeight: isPortrait ? 0.0 : 500
      ),
      padding: const EdgeInsets.all(16),
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
                      ref.read(tabHomeController.notifier).changeRevenueDateIndex(newIndex);
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
          h20,
          Row(
            children: [
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
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
                    Row(
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
                  ],
                ),
              ),
              w10,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
