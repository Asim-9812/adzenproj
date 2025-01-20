


import 'package:adzenproj/src/features/tablet/dashboard/application/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../../../core/common/common_widgets.dart';
import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';


class SideBar extends ConsumerStatefulWidget {
  const SideBar({super.key});

  @override
  ConsumerState<SideBar> createState() => _SideBarState();
}

class _SideBarState extends ConsumerState<SideBar> {

  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(

      color: MyColors.primaryColor,
      child: Column(
        children: [
          Container(
            color: MyColors.black.withOpacity(0.5),
            padding: EdgeInsets.all(8),
            child: logo(),
          ),
          h20,
          InkWell(
              onTap: (){
                ref.read(tabDashboardController.notifier).changeIndex(0);
              },
              child: Icon(Icons.home_filled, color: MyColors.white.withOpacity(0.75),)),
          Spacer(),
          AnimatedContainer(
            duration: Duration(milliseconds: 800),
            child: _isExpanded
                ? SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                      onTap: (){
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Icon(Icons.arrow_drop_down,color: MyColors.white,)),
                  Icon(Icons.settings,color: MyColors.white,size: 16,),
                  h10,
                  Icon(Icons.logout,color: MyColors.white,size: 16,)
                ],
              ),
            )
                : InkWell(
                onTap: (){
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Icon(Icons.arrow_drop_up,color: MyColors.white,)),
          ),
          h10,
          InkWell(
              onTap: (){
                ref.read(tabDashboardController.notifier).changeIndex(1);
              },
              child: profileCard()),
          h20,
        ],
      ),
    );
  }
}
