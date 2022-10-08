import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TaskController extends GetxController {
  /// Put obs to the [TextEditingController] to make it listenable
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> startTimeController = TextEditingController().obs;
  Rx<TextEditingController> endTimeController = TextEditingController().obs;
}
