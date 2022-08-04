import 'package:flutter_application_7/back/widgets/mainpage/widgets/achievement/data/achievements.dart';

class DataAchievementShown {
  late dynamic title;
  late dynamic subTitle;
  late dynamic icon;

  DataAchievementShown(this.title, this.subTitle, this.icon);
}

DataAchievementShown basicDas = DataAchievementShown(null, null, null);
late List<DataAchievementShown> popUpAchievement;

void initPopUpAchievement() {
  popUpAchievement = [];
}

void changePopUpAchievement(int index) {
  popUpAchievement
      .add(DataAchievementShown(a[index].title, a[index].text, a[index].icon));
}
