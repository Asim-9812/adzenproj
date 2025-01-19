



import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';




final mobileHomeController = ChangeNotifierProvider.autoDispose((ref) => MobileHomeController());


class MobileHomeController extends ChangeNotifier{

  int homeIndex = 0;
  bool isTabVisible = false;
  Timer? timer;
  PageController pageController = PageController();

  int dateIndex = 0;
  List<String> dateFilters = [
    'Year-to-date',
    'This month',
    'Quarterly'
  ];

  void changeIndex(int value){
    homeIndex = value;
    pageController.jumpToPage(value);
    notifyListeners();
  }

  void changeDateIndex(int value){
    dateIndex = value;
    notifyListeners();
  }

  void changeStatus(){
    isTabVisible = true;
    notifyListeners();
    timer?.cancel();
    timer = Timer(const Duration(seconds: 3), (){
      isTabVisible = false;
      notifyListeners();
    });
  }

}