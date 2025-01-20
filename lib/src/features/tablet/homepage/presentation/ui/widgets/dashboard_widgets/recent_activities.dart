


import 'package:flutter/material.dart';

import '../../../../../../../core/resources/color_manager.dart';
import '../../../../../../../core/resources/font_manager.dart';
import '../../../../../../../core/resources/gap_manager.dart';

class RecentActivities extends StatelessWidget {
  final bool isPortrait;
  const RecentActivities({required this.isPortrait,super.key});

  @override
  Widget build(BuildContext context) {
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
          minHeight: isPortrait ? 550 : 500
      ),
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text('Recent Activities',style: mbr1,textAlign: TextAlign.center,),
          h20,
          Container(
            decoration: BoxDecoration(
                color: MyColors.green,
                borderRadius: BorderRadius.circular(12)
            ),
            padding: const EdgeInsets.all(8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('Jane Doe',style: TextStyle(color: MyColors.white,fontSize: 12,fontWeight: FontWeight.w600),),
                    w08,
                    Text('9:44 AM',style: TextStyle(color: MyColors.white,fontSize: 10),)
                  ],
                ),
                Text('Added a stock in inventory.',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          const Divider(
            height: 24,
            indent: 8,
            endIndent: 8,
          ),
          Container(
            decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(12)
            ),
            padding: const EdgeInsets.all(8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('James Jr',style: TextStyle(color: MyColors.white,fontSize: 12,fontWeight: FontWeight.w600),),
                    w08,
                    Text('9:44 AM',style: TextStyle(color: MyColors.white,fontSize: 10),)
                  ],
                ),
                Text('Sales order completed.',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          const Divider(
            height: 24,
            indent: 8,
            endIndent: 8,
          ),
          Container(
            decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(12)
            ),
            padding: const EdgeInsets.all(8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('James Jr',style: TextStyle(color: MyColors.white,fontSize: 12,fontWeight: FontWeight.w600),),
                    w08,
                    Text('9:44 AM',style: TextStyle(color: MyColors.white,fontSize: 10),)
                  ],
                ),
                Text('Sales order completed.',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          const Divider(
            height: 24,
            indent: 8,
            endIndent: 8,
          ),
          Container(
            decoration: BoxDecoration(
                color: MyColors.primaryColor,
                borderRadius: BorderRadius.circular(12)
            ),
            padding: const EdgeInsets.all(8),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text('James Jr',style: TextStyle(color: MyColors.white,fontSize: 12,fontWeight: FontWeight.w600),),
                    w08,
                    Text('9:44 AM',style: TextStyle(color: MyColors.white,fontSize: 10),)
                  ],
                ),
                Text('Sales order completed.',style: TextStyle(color: MyColors.white,fontWeight: FontWeight.w500),)
              ],
            ),
          ),
          const Divider(
            height: 24,
            indent: 8,
            endIndent: 8,
          ),
          h20,
          const Center(child: Text('See More',style: mbs1,))
        ],
      ),
    );
  }
}
