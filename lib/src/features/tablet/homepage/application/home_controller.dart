import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// A Riverpod provider for managing the state of the tablet home dashboard.
///
/// This provider uses [ChangeNotifier] to manage state changes and update the UI accordingly.
final tabHomeController = ChangeNotifierProvider.autoDispose(
      (ref) => TabHomeController(),
);

/// A controller class for managing the state of the tablet dashboard.
///
/// This class handles user interactions, page navigation, tab visibility, and
/// date filters to ensure a smooth and dynamic user experience.
class TabHomeController extends ChangeNotifier {

  /// The index of the currently selected date filter for revenue.
  int revenueDateIndex = 0;

  /// The index of the currently selected date filter for customer.
  int customerDateIndex = 0;

  /// The index of the currently selected date filter for operations.
  int operationDateIndex = 0;

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


  /// Changes the selected date filter index and updates the UI.
  ///
  /// - [value]: The index of the new date filter.
  void changeRevenueDateIndex(int value) {
    revenueDateIndex = value;
    notifyListeners(); // Notify listeners to rebuild the UI with the new filter.
  }

  /// Changes the selected date filter index and updates the UI.
  ///
  /// - [value]: The index of the new date filter.
  void changeCustomerDateIndex(int value) {
    customerDateIndex = value;
    notifyListeners(); // Notify listeners to rebuild the UI with the new filter.
  }

  /// Changes the selected date filter index and updates the UI.
  ///
  /// - [value]: The index of the new date filter.
  void changeOperationDateIndex(int value) {
    operationDateIndex = value;
    notifyListeners(); // Notify listeners to rebuild the UI with the new filter.
  }
}
