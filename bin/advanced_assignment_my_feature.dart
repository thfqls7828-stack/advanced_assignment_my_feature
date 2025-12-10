import 'package:advanced_assignment_my_feature/add_student.dart';
import 'package:advanced_assignment_my_feature/load_student_data.dart';
import 'package:advanced_assignment_my_feature/select_menu.dart';

void main(List<String> arguments) async {
  const filePath = "lib/models/student.txt";

  await loadStudentData(filePath);

  while (true) {
    final int num = selectMenu();
    switch (num) {
      case 1:
        await addStudent(filePath);
      case 2:
      // printStudentInfo(filePath);
      case 3:
        return;
    }
  }
}
