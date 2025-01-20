


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final tabDashboardController = ChangeNotifierProvider.autoDispose(
      (ref) => TabDashboardController(),
);



class TabDashboardController extends ChangeNotifier{

  int pageIndex = 0;

  PageController pageController = PageController();


  void changeIndex(int value){
    pageIndex = value;
    pageController.jumpToPage(value);
    notifyListeners();
  }


}