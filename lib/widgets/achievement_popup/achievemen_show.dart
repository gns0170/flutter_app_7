import 'package:flutter/material.dart';
import 'package:flutter_application_7/provider/refer_value.dart';
import 'package:flutter_application_7/widgets/achievement_popup/achievement_view.dart';
import '../../values/colors.dart' as custom_colors;

//Higher Process
void shownAchieve(context, title, subTitle, icon) async {
  for (int index = 0; index < referDas.length; index++) {
    if (index == 0) {
      showAchievementView(context, referDas[index].title,
          referDas[index].subTitle, referDas[index].icon);
    } else {
      await Future.delayed(const Duration(seconds: 4)).then((value) =>
          showAchievementView(context, referDas[index].title,
              referDas[index].subTitle, referDas[index].icon));
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
      isCircle: true, listener: (status) {
    print(status);
  });

  a1.show();
}


// class ShowAchievementView extends StatefulWidget {
//   const ShowAchievementView(
//       {Key? key, required this.title, required this.subTitle, this.icon})
//       : super(key: key);
//   final String title;
//   final String subTitle;
//   final dynamic icon;

//   @override
//   _ShownAchievementView createState() => _ShownAchievementView();
// }

// class _ShownAchievementView extends State<ShowAchievementView> {
//   late String title;
//   late String subTitle;
//   late dynamic icon;

//   Widget build(BuildContext context) {
//     dynamic a1 = AchievementView(context,
//         title: title + "          ",
//         subTitle: subTitle,
//         icon: icon ?? const Icon(Icons.insert_emoticon),
//         color: custom_colors.primaryColor4.withOpacity(0.9),
//         isCircle: true, listener: (status) {
//       print(status);
//     });
//     return a1..show();
//   }
// }

