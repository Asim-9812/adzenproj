

import 'package:adzenproj/src/core/common/common_widgets.dart';
import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/core/resources/gap_manager.dart';
import 'package:flutter/material.dart';

import '../../../../../core/resources/font_manager.dart';

class MobileProfilePage extends StatelessWidget {
  const MobileProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(image: AssetImage('assets/images/cover.jpg'),fit: BoxFit.cover)
                      ),
                    )
                ),
                Expanded(
                    flex:3,
                    child: SizedBox())
              ],
            ),
            Column(
              children: [
                Expanded(
                    flex: 1,
                    child: SizedBox()
                ),
                Expanded(
                    flex:5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          profileCard(radius: 50),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('John Doe',style: mbh2,),
                              w04,
                              Icon(Icons.edit,color: MyColors.primaryColor,)
                            ],
                          ),
                          Text('Marketing Manager',style: mgr1,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pin_drop,color: MyColors.primaryColor,size: 16,),
                              w04,
                              Text('New Baneshwar, Kathmandu',style: mbs1,),

                            ],
                          ),
                          h10,
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: MyColors.grey,
                                      width: 2
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.phone,color: MyColors.primaryColor,size: 16,),
                                      w08,
                                      Text('9818654321',style: mbs1,)
                                    ],
                                  ),
                                ),
                              ),
                              w08,
                              Expanded(
                                child: Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColors.grey,
                                        width: 2
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.mail,color: MyColors.primaryColor,size: 16,),
                                      w08,
                                      Text('johndoe@gmail.com',style: mbs1,)
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
