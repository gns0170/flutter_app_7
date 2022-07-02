class DataAchievementShown {
  late dynamic title;
  late dynamic subTitle;
  late dynamic icon;

  DataAchievementShown(this.title, this.subTitle, this.icon);
}

DataAchievementShown basicDas = DataAchievementShown(null, null, null);
List<DataAchievementShown> referDas = [];

void initReferDas() {
  referDas = [];
}
