

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
                // Cover section at the top
                Expanded(
                    flex: 1,
                    child: cover()
                ),
                // Empty section to balance the layout
                const Expanded(
                    flex: 3,
                    child: SizedBox())
              ],
            ),
            Column(
              children: [
                // Notification button at the top right
                Expanded(
                    flex: 1,
                    child: SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16.0, top: 32),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            notificationButton(),  // Notification button widget
                          ],
                        ),
                      ),
                    )
                ),
                // Profile card and user information section
                Expanded(
                    flex: 6,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          profileCard(radius: 50),  // Profile picture and details card
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('John Doe', style: mbh2,),  // User's name
                              w04,
                              Icon(Icons.edit, color: MyColors.primaryColor,)  // Edit icon
                            ],
                          ),
                          const Text('Marketing Manager', style: mgr1,),  // Job title
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.pin_drop, color: MyColors.primaryColor, size: 16,),  // Location icon
                              w04,
                              Text('New Baneshwar, Kathmandu', style: mbs1,),  // User's location
                            ],
                          ),
                          h10,
                          Row(
                            children: [
                              // Phone number container with icon and text
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColors.grey,
                                        width: 2
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.phone, color: MyColors.primaryColor, size: 16,),  // Phone icon
                                      w08,
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text('9818654321', style: mbs1,),  // Phone number
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              w08,
                              // Email container with icon and text
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: MyColors.grey,
                                        width: 2
                                    ),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: const Row(
                                    children: [
                                      Icon(Icons.mail, color: MyColors.primaryColor, size: 16,),  // Email icon
                                      w08,
                                      Expanded(
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Text('johndoe@gmail.com', style: mbs1,),  // Email address
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          h10,
                          // List view with profile-related options
                          Expanded(
                            child: ListView(
                              children: [
                                // Material widget helps prevent UI bleeding and overlapping
                                // from the listTiles while scrolling.
                                //
                                // Sales Overview section
                                Material(
                                  color: MyColors.white,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                    shape: ContinuousRectangleBorder(
                                        side: const BorderSide(
                                            color: MyColors.grey,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(32)
                                    ),
                                    leading: const Icon(Icons.business_center_rounded, color: MyColors.primaryColor,),
                                    title: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        const Text('Sales Overview', style: mbr1,),
                                        const Row(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text('500', style: mbh2,),
                                            w04,
                                            Text('completed of 750 orders.', style: mgs1,)
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
                                    ),
                                    trailing: const Icon(Icons.chevron_right_rounded,),
                                  ),
                                ),
                                h10,
                                // Tasks in hand section
                                Material(
                                  color: MyColors.white,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                    shape: ContinuousRectangleBorder(
                                        side: const BorderSide(
                                            color: MyColors.grey,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(32)
                                    ),
                                    leading: const Icon(Icons.note_alt, color: MyColors.primaryColor,),
                                    title: Column(
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
                                        )
                                      ],
                                    ),
                                    trailing: const Icon(Icons.chevron_right_rounded,),
                                  ),
                                ),
                                h10,
                                // Recent Activities section
                                Material(
                                  color: MyColors.white,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                    shape: ContinuousRectangleBorder(
                                        side: const BorderSide(
                                            color: MyColors.grey,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(32)
                                    ),
                                    leading: const Icon(Icons.history, color: MyColors.primaryColor,),
                                    title: const Text('Recent Activities', style: mbs1,),
                                    trailing: const Icon(Icons.chevron_right_rounded,),
                                  ),
                                ),
                                h10,
                                // Privacy Policy section
                                Material(
                                  color: MyColors.white,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                    shape: ContinuousRectangleBorder(
                                        side: const BorderSide(
                                            color: MyColors.grey,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(32)
                                    ),
                                    leading: const Icon(Icons.policy, color: MyColors.primaryColor,),
                                    title: const Text('Privacy Policy', style: mbs1,),
                                    trailing: const Icon(Icons.chevron_right_rounded,),
                                  ),
                                ),
                                h10,
                                // Help & Support section
                                Material(
                                  color: MyColors.white,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                    shape: ContinuousRectangleBorder(
                                        side: const BorderSide(
                                            color: MyColors.grey,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(32)
                                    ),
                                    leading: const Icon(Icons.question_mark, color: MyColors.primaryColor,),
                                    title: const Text('Help & Support', style: mbs1,),
                                    trailing: const Icon(Icons.chevron_right_rounded,),
                                  ),
                                ),
                                h10,
                                // Log out section
                                Material(
                                  color: MyColors.white,
                                  child: ListTile(
                                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                                    shape: ContinuousRectangleBorder(
                                        side: const BorderSide(
                                            color: MyColors.grey,
                                            width: 2
                                        ),
                                        borderRadius: BorderRadius.circular(32)
                                    ),
                                    leading: const Icon(Icons.logout, color: MyColors.primaryColor,),
                                    title: const Text('Log out', style: mbs1,),
                                  ),
                                ),
                                h50,
                                // Version label at the bottom
                                const Center(child: Text('Version 1.0.0', style: mgs1,)),
                                h100,
                              ],
                            ),
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
