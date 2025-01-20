

import 'package:adzenproj/src/features/tablet/profile_page/presentation/ui/widgets/profile_widgets/appbar.dart';
import 'package:adzenproj/src/features/tablet/profile_page/presentation/ui/widgets/profile_widgets/profile_card_widget.dart';
import 'package:adzenproj/src/features/tablet/profile_page/presentation/ui/widgets/profile_widgets/recent_activities.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/common/common_widgets.dart';
import '../../../../../../core/resources/color_manager.dart';
import '../../../../../../core/resources/font_manager.dart';
import '../../../../../../core/resources/gap_manager.dart';

class TabLandscapeProfile extends StatelessWidget {
  const TabLandscapeProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 16.0,right: 16,left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileAppBar(),
            h30,
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileCardWidget(),
                    h10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(16),
                                      border: Border.all(
                                          color: MyColors.grey,
                                          width: 4
                                      )
                                  ),
                                  width: double.infinity,
                                  constraints:  BoxConstraints(
                                      minHeight:  160
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      const Text('Sales Overview', style: mbh2,),
                                      const Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('500', style: mbh2,),
                                          w04,
                                          Text('orders completed', style: mgs1,)
                                        ],
                                      ),
                                      const Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text('of', style: mgs1,),
                                          w04,
                                          Text('750', style: mbh2,),
                                          w04,
                                          Text('targeted orders.', style: mgs1,)
                                        ],
                                      ),
                                      const SizedBox(height: 8,),
                                      // Progress bar for sales
                                      Container(
                                        decoration: BoxDecoration(
                                            color: MyColors.darkGrey,
                                            borderRadius: BorderRadius.circular(10)
                                        ),
                                        height: 8,
                                        width: double.infinity,
                                        child: Row(
                                          children: [
                                            Expanded(
                                              flex: 3,
                                              child: Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: MyColors.primaryColor,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: MyColors.darkGrey,
                                                    borderRadius: BorderRadius.circular(10)
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  )
                              ),
                              h10,
                              Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    border: Border.all(
                                        color: MyColors.grey,
                                        width: 4
                                    )
                                ),
                                width: double.infinity,
                                constraints:  BoxConstraints(
                                    minHeight:  280
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text('Tasks in hand', style: mbr1,),
                                    const Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('40', style: mbh2,),
                                        w04,
                                        Text('remaining of 100.', style: mgs1,)
                                      ],
                                    ),
                                    const SizedBox(height: 8,),
                                    // Progress bar for tasks
                                    Container(
                                      decoration: BoxDecoration(
                                          color: MyColors.darkGrey,
                                          borderRadius: BorderRadius.circular(10)
                                      ),
                                      height: 8,
                                      width: double.infinity,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            flex: 3,
                                            child: Container(
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  color: MyColors.green,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Container(
                                              height: 8,
                                              decoration: BoxDecoration(
                                                  color: MyColors.darkGrey,
                                                  borderRadius: BorderRadius.circular(10)
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Divider(),
                                    h10,
                                    Container(
                                      decoration: BoxDecoration(
                                          color: MyColors.red,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                          child: Text('Need to add new stocks.',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.w500),)),
                                    ),
                                    h10,
                                    Container(
                                      decoration: BoxDecoration(
                                          color: MyColors.red,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                          child: Text('Return orders needs to be collected.',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.w500),)),
                                    ),
                                    h10,
                                    Container(
                                      decoration: BoxDecoration(
                                          color: MyColors.yellow,
                                          borderRadius: BorderRadius.circular(12)
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Center(
                                          child: Text('Return orders needs to be collected.',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.w500),)),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        w10,
                        Expanded(
                          flex: 1,
                          child: PersonalRecentActivities(isPortrait: true,),
                        ),
                      ],
                    ),
                    h10,
                    Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                                color: MyColors.grey,
                                width: 4
                            )
                        ),
                        width: double.infinity,
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('News & Updates', style: mbh3,),
                                const Text('January 15, 2025', style: mbs1,),
                              ],
                            ),
                            h20,
                            ListTile(
                              leading: logo(),
                              title: Wrap(
                                children: [
                                  Text('Effective March 2025 commissions for premium products will increase by 10%. Details available on the portal. Jan 15, 2025',style: TextStyle(fontSize: 16),),
                                ],
                              ),
                            ),
                            Divider(),
                            ListTile(
                              leading: logo(),
                              title: Wrap(
                                children: [
                                  Text('Effective March 2025 commissions for premium products will increase by 10%. Details available on the portal. Jan 15, 2025',style: TextStyle(fontSize: 16),),
                                ],
                              ),
                            ),
                            Divider(),
                            h20,
                            Center(child: Text('See more',style: mgs1,))
                          ],
                        )
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
