import 'dart:convert';
import 'dart:io';

import 'package:advanced_assignment_my_feature/load_student_data.dart';

Future<void> printStudentInfo(String filePath) async {
  final studentList = await loadStudentData(filePath);

  print("검색하려는 학생의 이름을 입력하세요.");
  final name = stdin.readLineSync(encoding: utf8) ?? "N/A";

  for (final student in studentList) {
    if (student.name == name) {
      print("이름 :${student.name}");
      print("성적 : ${student.score}");
      print("성별 : ${(student.isMan) ? "남자" : "여자"}");
    }
  }
}
