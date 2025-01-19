


import 'package:adzenproj/src/core/common/common_widgets.dart';
import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/application/home_controller.dart';
import 'package:adzenproj/src/features/mobile/homepage/data/model/graph_model.dart';
import 'package:adzenproj/src/features/mobile/homepage/presentation/ui/widgets/charts_widgets/sample_bar_charts.dart';
import 'package:adzenproj/src/features/mobile/homepage/presentation/ui/widgets/charts_widgets/sample_line_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';

class CustomerMobile extends ConsumerWidget {
  const CustomerMobile({super.key});

  @override
  Widget build(BuildContext context,ref) {
    final dateFilters = ref.watch(mobileHomeController).dateFilters;
    final dateIndex = ref.watch(mobileHomeController).dateIndex;

    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            if (scrollNotification is ScrollStartNotification ||
                scrollNotification is ScrollUpdateNotification) {
              // Handle scrolling gestures
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
                      const Text('Customers',style: mbh2,),
                      PopupMenuButton(
                        // icon: Icon(Icons.arrow_drop_down),
                        color: MyColors.white,
                        position: PopupMenuPosition.under,
                        itemBuilder: (context) {
                          return dateFilters.map((e)=>PopupMenuItem(
                              onTap: (){
                                final newIndex = dateFilters.indexOf(e);
                                ref.read(mobileHomeController.notifier).changeDateIndex(newIndex);
                              },
                              child: Text(e))).toList();
                        },
                        // icon: Icon(Icons.arrow_drop_down),
                        child: Row(
                          children: [
                            Text(dateFilters[dateIndex],style: mbs1,),
                            const Icon(Icons.arrow_drop_down),
                          ],
                        ),
                      )
                    ],
                  ),
                  Text(dateFormat(type: dateIndex)),
                  const Divider(),
                  h10,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: MyColors.white,
                          child: Icon(Icons.groups,color: MyColors.primaryColor)),
                      w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('New Customers',style: mbh3,),
                          Text('250',style: mbh2,),
                          Row(
                            children: [
                              Icon(Icons.keyboard_arrow_up,color: MyColors.green,),
                              Text('4%',style: TextStyle(color: MyColors.green,fontSize: 12,fontWeight: FontWeight.normal),),
                              w04,
                              Text('vs 240 prev month',style: mbs1,)
                            ],
                          )

                        ],
                      )
                    ],
                  ),
                  h20,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                          backgroundColor: MyColors.white,
                          child: Icon(Icons.people_alt_outlined,color: MyColors.primaryColor)),
                      w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Customer Lifetime Value',style: mbr1,),
                          Text('Rs. 3000',style: mbh3,),
                          Row(
                            children: [
                              Icon(Icons.keyboard_arrow_up,color: MyColors.green,),
                              Text('7%',style: TextStyle(color: MyColors.green,fontSize: 12,fontWeight: FontWeight.normal),),
                              w04,
                              Text('vs Rs. 2790 prev month',style: mbs1,)
                            ],
                          )

                        ],
                      )
                    ],
                  ),
                  h20,
                  const Divider(),
                  h10,
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.line_axis,color: MyColors.primaryColor,),
                      w16,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Customer Statistics',style: mbh3,),

                        ],
                      )
                    ],
                  ),
                  h20,
                  BarChartWidget(barData),
                  h100
                ]
            ),
          ),
        )
    );
  }
}
