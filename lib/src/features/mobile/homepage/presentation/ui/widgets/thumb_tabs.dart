

import 'package:adzenproj/src/core/resources/color_manager.dart';
import 'package:adzenproj/src/features/mobile/homepage/application/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// A side tab widget that allows switching between pages
/// on the dashboard homepage. It controls the visibility
/// and the current page index by toggling between options.
/// This widget animates its position and updates the selected
/// index based on user interaction.
class ThumbTabs extends ConsumerWidget {
  const ThumbTabs({super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<String> texts = ['R', 'C'];  // The text values for the tabs
    final index = ref.watch(mobileHomeController).homeIndex;  // Current selected index
    final isVisible = ref.watch(mobileHomeController).isTabVisible;  // Whether the tab is visible or not

    return AnimatedPositioned(
      duration: isVisible ? const Duration(milliseconds: 500) : const Duration(seconds: 2),  // Control the animation duration
      right: isVisible ? 0 : -200,  // Adjust the tab's position based on visibility (move it off-screen when not visible)
      top: 120,  // Set the top position for the tab
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,  // Align the tabs to the right
        children: [
          // Generate the tab items dynamically from the 'texts' list
          ...texts.map((e) {
            final newIndex = texts.indexOf(e);  // Get the index of the current tab
            return InkWell(
              splashColor: Colors.transparent,  // Disable splash effect
              onTap: () {
                // Update the state when a tab is clicked
                ref.read(mobileHomeController.notifier).changeIndex(newIndex);  // Change the current tab index
                ref.read(mobileHomeController.notifier).changeStatus();  // Change the tab visibility
                ref.read(mobileHomeController.notifier).changeDateIndex(newIndex);  // Change the date index based on tab
              },
              child: Card(
                margin: EdgeInsets.zero,  // Remove default margin
                child: Container(
                  decoration: BoxDecoration(
                    color: index == newIndex ? MyColors.primaryColor : MyColors.darkGrey,  // Highlight selected tab
                    border: Border.all(color: Colors.black),  // Border around the tab
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8),  // Rounded corners for the top-left side
                      bottomLeft: Radius.circular(8),  // Rounded corners for the bottom-left side
                    ),
                  ),
                  padding: EdgeInsets.only(top: 12, bottom: 12, left: 12, right: index == newIndex ? 32 : 16),  // Adjust padding based on tab selection
                  child: Center(
                    child: Text(
                      e,  // Display tab text
                      style: TextStyle(color: index == newIndex ? MyColors.white : MyColors.black),  // Change text color based on selection
                    ),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}


