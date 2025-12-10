import 'package:advanced_assignment_my_feature/add_student.dart';
import 'package:advanced_assignment_my_feature/load_student_data.dart';

void main(List<String> arguments) async {
  const filePath = "lib/models/student.txt";

  await loadStudentData(filePath);
  addStudent(filePath);
}
