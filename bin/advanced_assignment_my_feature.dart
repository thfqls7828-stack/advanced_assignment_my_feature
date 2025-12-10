import 'package:advanced_assignment_my_feature/add_student.dart';
import 'package:advanced_assignment_my_feature/print_student_info.dart';
import 'package:advanced_assignment_my_feature/select_menu.dart';

void main(List<String> arguments) async {
  const filePath = "lib/models/student.txt";

  while (true) {
    final int num = selectMenu();

    switch (num) {
      case 1:
        await addStudent(filePath);
        break;
      case 2:
        await printStudentInfo(filePath);
        break;
      case 3:
        return;
    }
  }
}
