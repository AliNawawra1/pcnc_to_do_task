import 'package:get/get.dart';
import 'package:pcnc_todo_task/domain/interactors_impl/category_interactor_impl.dart';
import 'package:pcnc_todo_task/presentation/dashbord/controllers/home_screen_controller.dart';

import '../../../domain/entities/category.dart';
import '../../../domain/entities/task.dart';

class HomeScreenTaskListViewController extends GetxController {
  HomeScreenTaskListViewController(this.homeController);

  final HomeController homeController;
  final CategoryInteractorImpl categoryInteractorImpl =
      CategoryInteractorImpl();
  RxMap<int, Category> categoryCache = <int, Category>{}.obs;

  void toggleTaskCompletion(Task task) async {
    task.isCompleted = !task.isCompleted;
    await homeController.taskInteractorImpl.updateTask(task);

    int index = homeController.tasks.indexOf(task);
    if (index != -1) homeController.tasks[index] = task;
  }

  void loadCategory(int categoryId) async {
    final category = await categoryInteractorImpl.getCategoryById(categoryId);
    categoryCache[categoryId] = category;
  }

  List<Task> get tasks => homeController.tasks;
}
