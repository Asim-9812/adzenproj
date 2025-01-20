



import 'package:flutter/material.dart';

import '../../../../../../../core/common/common_widgets.dart';
import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      height: 500,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded(
                  flex: 3,
                  child: tabCover()
              ),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                            left: BorderSide(
                                color: MyColors.grey,
                                width: 4
                            ),
                            right: BorderSide(
                                color: MyColors.grey,
                                width: 4
                            ),
                            bottom: BorderSide(
                                color: MyColors.grey,
                                width: 4
                            )
                        ),
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(16))
                    ),
                  )
              )
            ],
          ),
          Column(
            children: [
              Expanded(
                  flex: 2,
                  child: SizedBox()
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Card(
                                elevation: 5,
                                shape: CircleBorder(),
                                child: profileCard(radius: 75)),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('John Doe', style: mbh2,),  // User's name
                                    w04,
                                    Icon(Icons.edit, color: MyColors.primaryColor,)  // Edit icon
                                  ],
                                ),
                                Text('Marketing Manager', style: mgr1,),
                              ],
                            )
                          ],
                        ),
                        h10,
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.pin_drop, color: MyColors.primaryColor,),
                            w10,
                            Text('New Baneshwar, Kathmandu', style: mbr1,),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.phone, color: MyColors.primaryColor,),
                            w10,
                            Text('9818654321', style: mbr1,),
                          ],
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.mail, color: MyColors.primaryColor),
                            w10,
                            Text('johndoe@gmail.com', style: mbr1,),
                          ],
                        ),
                        h10,
                      ],
                    ),
                  )
              )
            ],
          ),

        ],
      ),
    );
  }
}
