import 'dart:io';
import 'dart:convert';

import 'package:advanced_assignment_my_feature/student_info.dart';

Future<List<StudentInfo>> loadStudentData(String filePath) async {
  List<StudentInfo> studentList = [];

  try {
    final file = File(filePath);
    final jsonString = await file.readAsString();
    final jsonList = jsonDecode(
      jsonString,
    ); // String -> List<Map<String,dynamic>>

    // 역직렬화
    for (final json in jsonList) {
      studentList.add(StudentInfo.fromJson(json));
    }
  } catch (e) {
    print("학생 정보를 불러올 수 없습니다 : ${e.toString()}");
  }

  return studentList;
}
