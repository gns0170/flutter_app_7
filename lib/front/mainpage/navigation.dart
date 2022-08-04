import 'package:flutter/material.dart';

enum MainPage { home, question, result }

enum PageStatus { on, off }

class MainNavigation extends ChangeNotifier {
  //Single Page 관리
  MainPage _pageView = MainPage.home;
  MainPage get pageView => _pageView;

  void changePage(pageName) {
    if (pageName is MainPage) {
      _pageView = pageName;
      notifyListeners();
    }
  }

  //스택 네비게이션 관리
  PageStatus _statistic = PageStatus.off;
  PageStatus _achievement = PageStatus.off;

  PageStatus get statistic => _statistic;
  PageStatus get achievement => _achievement;

  void statisticOnOff() {
    _statistic = _statistic == PageStatus.on ? PageStatus.off : PageStatus.on;
    notifyListeners();
  }

  void achievementOnOff() {
    _achievement =
        _achievement == PageStatus.on ? PageStatus.off : PageStatus.on;
    notifyListeners();
  }
}
