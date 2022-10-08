import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';
import 'time_converter.dart';

Future<void> selectDate(BuildContext context, String? startEnd) async {
  final taskController = Get.put(TaskController());

  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime.now(),
    lastDate: DateTime(2030, 12, 2),
  );

  if (startEnd == 'start') {
    taskController.startTimeController.value.text =
        TimeConverter.getProperDate(picked!);
  } else {
    taskController.endTimeController.value.text =
        TimeConverter.getProperDate(picked!);
  }
}
