import 'package:get/get.dart';

import '../controller/task_controller.dart';

void handleBack() {
  final taskController = Get.put(TaskController());

  //  reset all value of TextField Controller
  taskController.titleController.value.text = '';
  taskController.startTimeController.value.text = '';
  taskController.endTimeController.value.text = '';

  Get.back();
}
