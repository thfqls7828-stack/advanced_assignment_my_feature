import 'dart:convert';
import 'dart:io';

import 'package:advanced_assignment_my_feature/student_info.dart';

Future<void> addStudent(String filePath) async {
  final String name;
  final int score;
  final String gender;
  final bool isMan;
  final StudentInfo student;
  final List<dynamic> jsonList;
  String jsonString;
  final String result;

  print("학생 이름을 입력하세요");
  name = stdin.readLineSync(encoding: utf8) ?? "N/A";
  if (name == "N/A") {
    print("올바르지 않은 입력입니다.");
    return;
  }

  print("학생 점수를 입력하세요(0 ~ 100) ");
  score = int.tryParse(stdin.readLineSync(encoding: utf8) ?? "-1") ?? -1;

  print("학생 성별을 입력하세요(남자/여자) ");
  gender = stdin.readLineSync(encoding: utf8) ?? "N/A";
  if (gender == "N/A") {
    print("올바르지 않은 입력입니다.");
    return;
  }
  isMan = (gender == "남자") ? true : false;

  student = StudentInfo(name: name, score: score, isMan: isMan);
  final Map<String, dynamic> studentMap = student.toJson();

  try {
    final file = File(filePath);
    jsonString = await file.readAsString();
    jsonList = jsonDecode(jsonString);
    jsonList.add(studentMap);

    result = jsonEncode(jsonList);
    await file.writeAsString(result);

    print("학생 정보가 성공적으로 업로드 되었습니다.");
  } catch (e) {
    print("학생 정보를 업로드 할 수 없습니다 : ${e.toString()}");
  }
}
