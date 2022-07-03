List<bool> aCases(List<int> recordR, List<int> recordA) {
  List<bool> list = [
    false,
    //1
    recordR[0] == 1 &&
            recordR[4] == 1 &&
            recordR[8] == 1 &&
            recordR[12] == 1 &&
            recordR[16] == 1
        ? true
        : false,
    recordR[1] == 1 &&
            recordR[5] == 1 &&
            recordR[9] == 1 &&
            recordR[13] == 1 &&
            recordR[17] == 1
        ? true
        : false,
    recordR[2] == 1 &&
            recordR[6] == 1 &&
            recordR[10] == 1 &&
            recordR[14] == 1 &&
            recordR[18] == 1
        ? true
        : false,
    recordR[3] == 1 &&
            recordR[7] == 1 &&
            recordR[11] == 1 &&
            recordR[15] == 1 &&
            recordR[19] == 1
        ? true
        : false,
    //2
    recordR[0] == 1 && recordR[1] == 1 && recordR[2] == 1 && recordR[3] == 1
        ? true
        : false,
    recordR[4] == 1 && recordR[5] == 1 && recordR[6] == 1 && recordR[7] == 1
        ? true
        : false,
    recordR[8] == 1 && recordR[9] == 1 && recordR[10] == 1 && recordR[11] == 1
        ? true
        : false,
    recordR[12] == 1 && recordR[13] == 1 && recordR[14] == 1 && recordR[15] == 1
        ? true
        : false,
    recordR[16] == 1 && recordR[17] == 1 && recordR[18] == 1 && recordR[19] == 1
        ? true
        : false,
    //3
    false,
    false,
    false,
    false,
    false,
    //4
    ach4_1(recordA),
    false,
  ];

  return list;
}

//모든 결과 확인
bool ach4_1(recordA) {
  bool b = true;
  for (int i = 0; i < 17; i++) {
    b = recordA[i] == 1 ? b : false;
  }
  return b;
}
