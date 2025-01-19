


import 'package:adzenproj/src/core/common/common_widgets.dart';
import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/presentation/ui/mobile_homepage.dart';
import 'package:adzenproj/src/features/mobile/profile_page/presentation/ui/mobile_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MobileDashboard extends StatefulWidget {
  const MobileDashboard({super.key});

  @override
  State<MobileDashboard> createState() => _MobileDashboardState();
}

class _MobileDashboardState extends State<MobileDashboard> {

  final _pageController = PageController();
  int index = 0;


  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (newIndex){
          setState(() {
            index = newIndex;
          });
        },
        controller: _pageController,
        children: const [
          MobileHomepage(),
          MobileProfilePage()
        ],
      ),
      bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(32), topLeft: Radius.circular(32)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
            ],
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32.0),
              topRight: Radius.circular(32.0),
            ),
            child: BottomNavigationBar(
              currentIndex: index,
              onTap: (newIndex){
                setState(() {
                  index = newIndex;
                });
                _pageController.jumpToPage(index);
              },
              selectedIconTheme: const IconThemeData(color: MyColors.primaryColor),
              unselectedIconTheme: const IconThemeData(color: MyColors.darkGrey),
              showUnselectedLabels: false,
              showSelectedLabels: false,
              items: <BottomNavigationBarItem>[
                const BottomNavigationBarItem(
                    icon: Icon(Icons.home_filled,size: 32,), label: 'HOME'),
                BottomNavigationBarItem(
                    icon: profileCard(), label: 'PROFILE')
              ],
            ),
          )
      ),
    );
  }
}
