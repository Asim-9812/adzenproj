

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// A Flutter controller to manage a tab-based dashboard using Riverpod and PageView.
///
/// This controller helps in managing the state of the currently selected tab
/// in a dashboard layout. It provides methods to switch tabs and notifies
/// listeners when the tab changes.
///
/// [tabDashboardController] is a Riverpod provider for the [TabDashboardController].
///
/// The provider is auto-disposed when no longer needed to free resources.
final tabDashboardController = ChangeNotifierProvider.autoDispose(
      (ref) => TabDashboardController(),
);

/// A [ChangeNotifier] class to manage the state of a tabbed dashboard.
///
/// It includes methods for updating the current page index and controlling
/// navigation within a [PageView].
class TabDashboardController extends ChangeNotifier {
  /// The current index of the active tab/page.
  int pageIndex = 0;

  /// The [PageController] instance to control navigation in a [PageView].
  final PageController pageController = PageController();

  /// Changes the active tab index and navigates the [PageView] to the corresponding page.
  ///
  /// [value]: The index of the new active tab/page.
  void changeIndex(int value) {
    pageIndex = value;
    pageController.jumpToPage(value);
    notifyListeners();
  }
}
