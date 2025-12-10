# 🔎 나만의 기능 추가
## 프로그래밍 요구사항
- CSV -> JSON 파일 형식 변경
- 학생 추가 기능
- 학생 정보 검색 기능(동명이인은 두명 다 출력)

- ## 구현
```dart
import 'dart:convert';
import 'dart:io';

import 'package:advanced_assignment_my_feature/student_info.dart';

// 학생 추가 함수
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

  // 입력받은 정보들을 바탕으로 Map 생성
  student = StudentInfo(name: name, score: score, isMan: isMan);
  final Map<String, dynamic> studentMap = student.toJson();

  // 기존 파일에 추가 정보 덮어쓰기
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
```

```dart
import 'dart:io';
import 'dart:convert';

import 'package:advanced_assignment_my_feature/student_info.dart';

// 학생 데이터 불러오는 함수
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
```

```dart
import 'dart:convert';
import 'dart:io';

import 'package:advanced_assignment_my_feature/load_student_data.dart';

// 학생 정보 출력하는 함수
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
```

```dart
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
```

```dart
class StudentInfo {
  StudentInfo({required this.name, required this.score, required this.isMan});

  final String name;
  final int score;
  final bool isMan;

  factory StudentInfo.fromJson(Map<String, dynamic> json) {
    return StudentInfo(
      name: json["name"],
      score: json["score"],
      isMan: json["isMan"],
    );
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "score": score, "isMan": isMan};
  }
}
```

- StudentInfo class 내에 json 파일 직렬화/역직렬화를 위한 formJson, toJson 메서드 정의
- 기존 학생 정보를 불러와 역직렬화 후 생성된 List<Map<dynamic>>에 입력할 정보를 바탕으로 생성된 Map을 더한 뒤 다시 직렬화
- studentList를 반복문에 넣어 돌리고, 입력된 이름과 같은 SutdentInfo 확인 후 정보 출력
- 3번 입력 시 프로그램 종료

## 실행결과
<img width="293" height="410" alt="image" src="https://github.com/user-attachments/assets/536fc113-d097-4fc3-af3b-024561e4c85c" />

