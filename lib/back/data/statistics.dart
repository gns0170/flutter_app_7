import 'achievements/achievements.dart';
import 'results.dart';

enum StatisticKey {
  totalTry,
  kindOfResult,
  numberOfAchievement,
  mostFrequentPlayStyle,
  mostFrequentPosition,
}

class Statistic {
  final int key;
  final StatisticKey stringkey;
  final String title;
  final String unit;

  Statistic(this.key, this.stringkey, this.title, this.unit);
}

List<Statistic> s = [
  Statistic(0, StatisticKey.totalTry, "총 시도 횟수", '회'),
  Statistic(1, StatisticKey.kindOfResult, "본 결과 종류", '회/${r.length}회'),
  Statistic(
      2, StatisticKey.numberOfAchievement, "업적 달성 수", '회/${a.length - 4}회'),
  Statistic(3, StatisticKey.mostFrequentPlayStyle, "가장 자주 나온 플레이 성향", ''),
  Statistic(4, StatisticKey.mostFrequentPosition, "가장 자주 나온 포지션", ''),
];
