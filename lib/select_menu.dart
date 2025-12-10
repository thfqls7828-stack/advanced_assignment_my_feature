import 'dart:io';

// 메뉴 선택 기능
int selectMenu() {
  final int num;

  print("1. 학생 추가");
  print("2. 학생 정보 검색");
  print("3. 종료");

  num = int.tryParse(stdin.readLineSync() ?? "3")!;

  return num;
}
