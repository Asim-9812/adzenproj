import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A Riverpod provider for managing the state of the mobile home dashboard.
///
/// This provider uses [ChangeNotifier] to manage state changes and update the UI accordingly.
final mobileHomeController = ChangeNotifierProvider.autoDispose(
      (ref) => MobileHomeController(),
);

/// A controller class for managing the state of the mobile dashboard.
///
/// This class handles user interactions, page navigation, tab visibility, and
/// date filters to ensure a smooth and dynamic user experience.
class MobileHomeController extends ChangeNotifier {
  /// The index of the currently selected home page.
  int homeIndex = 0;

  /// Determines whether the tab menu is visible.
  bool isTabVisible = false;

  /// A timer to automatically hide the tab menu after a set duration.
  Timer? timer;

  /// A [PageController] to manage navigation between pages in the dashboard.
  PageController pageController = PageController();

  /// The index of the currently selected date filter.
  int dateIndex = 0;

  /// List of available date filters for the dashboard.
  ///
  /// Options include:
  /// - 'Year-to-date'
  /// - 'This month'
  /// - 'Quarterly'
  List<String> dateFilters = [
    'Year-to-date',
    'This month',
    'Quarterly',
  ];

  /// Changes the selected page index and updates the UI.
  ///
  /// Navigates to the page corresponding to [value] using [PageController].
  /// - [value]: The index of the new page.
  void changeIndex(int value) {
    homeIndex = value;
    pageController.jumpToPage(value); // Navigate to the selected page.
    notifyListeners(); // Notify listeners to rebuild the UI.
  }

  /// Changes the selected date filter index and updates the UI.
  ///
  /// - [value]: The index of the new date filter.
  void changeDateIndex(int value) {
    dateIndex = value;
    notifyListeners(); // Notify listeners to rebuild the UI with the new filter.
  }

  /// Toggles the visibility of the tab menu and sets a timer to hide it after 3 seconds.
  ///
  /// When called, the tab menu becomes visible. After 3 seconds, the timer
  /// automatically hides the tab menu and updates the UI.
  void changeStatus() {
    isTabVisible = true;
    notifyListeners(); // Notify listeners to show the tab.

    // Cancel any existing timer to avoid conflicts.
    timer?.cancel();

    // Start a new timer to hide the tab after 3 seconds.
    timer = Timer(const Duration(seconds: 3), () {
      isTabVisible = false;
      notifyListeners(); // Notify listeners to hide the tab.
    });
  }
}
