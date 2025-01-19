

import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/application/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ThumbTabs extends ConsumerWidget {
  const ThumbTabs({super.key});

  @override
  Widget build(BuildContext context,ref) {
    List<String> texts = ['R','C'];
    final index = ref.watch(mobileHomeController).homeIndex;
    final isVisible = ref.watch(mobileHomeController).isTabVisible;

    return AnimatedPositioned(
      duration: isVisible ? const Duration(milliseconds:500) : const Duration(seconds: 2),
      right: isVisible ? 0 : -200, // Adjust the value to control the animation
      top: 120,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ...texts.map((e) {
            final newIndex = texts.indexOf(e);
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                ref.read(mobileHomeController.notifier).changeIndex(newIndex);
                ref.read(mobileHomeController.notifier).changeStatus();
                ref.read(mobileHomeController.notifier).changeDateIndex(newIndex);
              },
              child: Card(
                margin: EdgeInsets.zero,
                child: Container(
                  decoration: BoxDecoration(
                    color: index == newIndex? MyColors.primaryColor : MyColors.darkGrey,
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                  ),
                  padding: EdgeInsets.only(top: 12,bottom: 12,left: 12,right:index ==newIndex ? 32: 16),
                  child: Center(child: Text(e,style: TextStyle(color: index == newIndex? MyColors.white : MyColors.black),)),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}

