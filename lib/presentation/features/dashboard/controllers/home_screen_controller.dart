import 'package:get/get.dart';
import 'package:pcnc_todo_task/domain/entities/task.dart';
import 'package:pcnc_todo_task/presentation/features/calendar/screens/calendar_screen.dart';

import '../../../../domain/interactors_impl/task_interactor_impl.dart';

class HomeController extends GetxController {
  Rx<int> taskCount = 0.obs;
  Rx<bool> isLoading = true.obs;
  Rx<bool> hasData = false.obs;
  RxList<Task> tasks = <Task>[].obs;

  final TaskInteractorImpl taskInteractorImpl = TaskInteractorImpl();

  @override
  void onInit() {
    super.onInit();
    loadTasks();
  }

  Future<void> refreshTasks() async {
    return loadTasks();
  }

  Future<void> addTask(Task newTask) async {
    try {
      await taskInteractorImpl.insertTask(newTask);
      loadTasks();
    } catch (error) {
      Get.snackbar("Error", "Failed to add task");
    }
  }

  void loadTasks() async {
    isLoading.value = true;

    try {
      tasks.value = await taskInteractorImpl.getTasks();
      taskCount.value = tasks.length;
      hasData.value = taskCount.value > 0;
    } catch (error) {
      Get.snackbar("Error", "Failed to load tasks");
    } finally {
      isLoading.value = false;
    }
  }

  void openCalendar() => Get.to(() => CalendarScreen());
}
