import 'package:get/get.dart';
import '../../../../domain/entities/task.dart';
import '/domain/entities/category.dart';
import '/domain/interactors_impl/category_interactor_impl.dart';
import '/presentation/features/dashbord/controllers/home_screen_controller.dart';

class HomeScreenTaskListViewController extends GetxController {
  HomeScreenTaskListViewController(this.homeController);

  final HomeController homeController;
  final CategoryInteractorImpl categoryInteractorImpl =
      CategoryInteractorImpl();
  RxMap<int, Rx<Category>> categoryCache = <int, Rx<Category>>{}.obs;

  void toggleTaskCompletion(Task task) async {
    task.isCompleted = !task.isCompleted;
    await homeController.taskInteractorImpl.updateTask(task);

    int index = homeController.tasks.indexOf(task);
    if (index != -1) homeController.tasks[index] = task;
  }

  void loadCategory(int categoryId) async {
    final category = await categoryInteractorImpl.getCategoryById(categoryId);
    categoryCache[categoryId] = category.obs;
  }

  RxList<Task> get tasks => homeController.tasks;
}
