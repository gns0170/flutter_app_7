import 'package:flutter/material.dart';
import 'package:flutter_application_7/back/functions/achievement_popup/achievement_view.dart';
import 'package:flutter_application_7/back/functions/achievement_popup/model.dart';

import 'package:flutter_application_7/front/provider/values/colors.dart'
    as custom_colors;

//Higher Process
void shownAchieve(context, title, subTitle, icon) async {
  for (int index = 0; index < popUpAchievement.length; index++) {
    if (index == 0) {
      showAchievementView(context, popUpAchievement[index].title,
          popUpAchievement[index].subTitle, popUpAchievement[index].icon);
    } else {
      await Future.delayed(const Duration(seconds: 4)).then((value) =>
          showAchievementView(context, popUpAchievement[index].title,
              popUpAchievement[index].subTitle, popUpAchievement[index].icon));
    }
  }
}

//View Form
void showAchievementView(BuildContext context, title, subTitle, icon) {
  dynamic a1 = AchievementView(context,
      title: (title ?? "텍스트 제목") + "     ",
      subTitle: subTitle ?? "텍스트 내용",
      icon: icon ?? const Icon(Icons.insert_emoticon, color: Colors.white),
      color: custom_colors.primaryColor4.withOpacity(0.9),
      isCircle: true,
      listener: (status) {});

  a1.show();
}
