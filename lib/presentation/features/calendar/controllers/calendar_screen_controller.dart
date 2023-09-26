import 'package:get/get.dart';

import '../../../../domain/entities/task.dart';
import '../../dashbord/controllers/home_screen_controller.dart';

class CalendarScreenController extends GetxController {
  final HomeController homeController;
  RxMap<DateTime, List<Task>> tasksByDate = <DateTime, List<Task>>{}.obs;

  CalendarScreenController(this.homeController) {
    _groupTasksByDate();
  }

  void _groupTasksByDate() {
    for (var task in homeController.tasks) {
      if (task.dueDate != null) {
        if (!tasksByDate.containsKey(task.dueDate!)) {
          tasksByDate[task.dueDate!] = [];
        }
        tasksByDate[task.dueDate!]!.add(task);
      }
    }
  }
}
