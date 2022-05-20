import 'package:flutter/material.dart';
import 'package:flutter_application_7/widgets/achievement_popup/achievement_view.dart';
import '../../values/colors.dart' as custom_colors;

void showAchievementView(BuildContext context) {
  dynamic a1 = AchievementView(context,
      title: "텍스트 제목               ",
      subTitle: "텍스트 바디",
      color: custom_colors.primaryColor4.withOpacity(0.9),
      isCircle: true, listener: (status) {
    print(status);
  });

  dynamic a2 = AchievementView(context,
      title: "텍스트 제목               ",
      subTitle: "텍스트 바디",
      color: custom_colors.primaryColor4.withOpacity(0.9),
      isCircle: true, listener: (status) {
    print(status);
  });

  a1..show();
}

void showAchievementView2(BuildContext context) {
  dynamic a1 = AchievementView(context,
      title: "텍스트 제목 232323              ",
      subTitle: "텍스트 바디2323",
      color: custom_colors.primaryColor4.withOpacity(0.9),
      isCircle: true, listener: (status) {
    print(status);
  });

  dynamic a2 = AchievementView(context,
      title: "텍스트 제목               ",
      subTitle: "텍스트 바디",
      color: custom_colors.primaryColor4.withOpacity(0.9),
      isCircle: true, listener: (status) {
    print(status);
  });

  a1..show();
}
