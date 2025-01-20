

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/common/charts_widgets/sample_graph_charts.dart';
import '../../../../../../../core/common/common_widgets.dart';
import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';
import '../../../../application/home_controller.dart';

class TabOperations extends ConsumerWidget {
  final bool isPortrait;
  const TabOperations({required this.isPortrait,super.key});

  @override
  Widget build(BuildContext context, ref) {

    final dateFilters = ref.watch(tabHomeController).dateFilters;
    final dateIndex = ref.watch(tabHomeController).operationDateIndex;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
              color: MyColors.grey,
              width: 4
          )
      ),
      width: double.infinity,
      constraints:  BoxConstraints(
          minHeight: isPortrait ? 0.0 : 550
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Operations', style: mbh2),
              PopupMenuButton(
                color: MyColors.white,
                position: PopupMenuPosition.under,
                itemBuilder: (context) {
                  // Create a menu for selecting different date filters
                  return dateFilters.map((e) => PopupMenuItem(
                    onTap: () {
                      final newIndex = dateFilters.indexOf(e);
                      ref.read(tabHomeController.notifier).changeOperationDateIndex(newIndex);
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
          const Row(
            children: [
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: MyColors.white,
                      child: Icon(Icons.compost_sharp, color: MyColors.primaryColor,size: 32,),
                    ),
                    w16,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Operation Costs', style: mbh3),
                          Text('Rs. 85,000', style: mbh2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(Icons.keyboard_arrow_up, color: MyColors.green),
                              Text('10%', style: TextStyle(color: MyColors.green, fontSize: 12, fontWeight: FontWeight.normal)),
                              w04,
                              Expanded(child: Text('vs Rs. 76,500 Q1 of 2024', style: mbs1)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              w10,
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start
                  ,
                  children: [
                    CircleAvatar(
                      backgroundColor: MyColors.white,
                      child: Icon(Icons.loop, color: MyColors.primaryColor),
                    ),
                    w16,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Turnover Ratio', style: mbr1),
                          Text('5.0', style: mbh2),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Rs. 150,000', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              w04,
                              Expanded(child: Text('costs of goods sold', style: mbs1)),  // Comparison with previous month
                            ],
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('vs', style: mbs1),
                              w04,
                              Text('Rs. 30,000', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                              w04,
                              Expanded(child: Text('avg. cost', style: mbs1)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          h10,
          Divider(),
          h10,
          const Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Quarterly Targets', style: mbh3),
                    h20,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: MyColors.white,
                          child: Icon(Icons.incomplete_circle, color: MyColors.primaryColor),
                        ),
                        w16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Order Fulfillment', style: mbh3),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Targeted', style: mbs1),
                                  w04,
                                  Text('5000', style: TextStyle(color: MyColors.yellow,fontSize: 12,fontWeight: FontWeight.normal)),
                                  w04,
                                  Text('vs', style: mbs1),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('3800', style: TextStyle(color: MyColors.primaryColor,fontSize: 16, fontWeight: FontWeight.bold)),
                                  w04,
                                  Expanded(child: Text('completed', style: mbs1)),  // Comparison with previous month
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    h20,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: MyColors.white,
                          child: Icon(Icons.bar_chart, color: MyColors.primaryColor),
                        ),
                        w16,
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Tasks', style: mbh3),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('Targeted', style: mbs1),
                                  w04,
                                  Text('500', style: TextStyle(color: MyColors.yellow,fontSize: 12,fontWeight: FontWeight.normal)),
                                  w04,
                                  Text('vs', style: mbs1),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('380', style: TextStyle(color: MyColors.primaryColor,fontSize: 16, fontWeight: FontWeight.bold)),
                                  w04,
                                  Expanded(child: Text('completed', style: mbs1)),  // Comparison with previous month
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              w10,
              Expanded(
                child: GraphChartWidget(),
              )
            ],
          )
        ],
      ),
    );
  }
}
