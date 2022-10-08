import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/task_controller.dart';
import '../global/app_color.dart';
import '../global/dimens.dart';
import '../helpers/api_helper.dart';
import '../helpers/handle_back.dart';
import '../helpers/time_converter.dart';
import '../models/task_model.dart';
import '../widgets/text_field_title_widget.dart';
import '../widgets/text_field_widget.dart';

class DetailsPage extends StatefulWidget {
  final TaskModel? taskModel;
  final String? docId;
  const DetailsPage({
    Key? key,
    this.taskModel,
    this.docId,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final taskController = Get.put(TaskController());
  int arrayToEdit = -1;

  @override
  void initState() {
    if (widget.taskModel != null) {
      taskController.titleController.value.text = widget.taskModel?.title ?? '';
      taskController.startTimeController.value.text =
          TimeConverter.getProperDate(
        widget.taskModel?.startDate ?? DateTime(1970, 01, 01),
      );
      taskController.endTimeController.value.text = TimeConverter.getProperDate(
        widget.taskModel?.endDate ?? DateTime(1970, 01, 01),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final taskController = Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
          ),
          onPressed: () {
            handleBack();
          },
        ),
        title: const Text('Add new To-Do List'),
      ),
      backgroundColor: AppColors.whiteColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Dimens.space16),
        child: ListView(
          children: [
            SizedBox(
              height: Dimens.space40,
            ),
            const TextFieldTitleWidget(
              title: 'To-Do Title',
            ),
            SizedBox(
              height: Dimens.space10,
            ),
            TextFieldWidget(
              hint: 'Please key in your To-Do title here',
              minLine: 6,
              controller: taskController.titleController.value,
            ),
            SizedBox(
              height: Dimens.space18,
            ),
            const TextFieldTitleWidget(
              title: 'Start Date',
            ),
            SizedBox(
              height: Dimens.space10,
            ),
            TextFieldWidget(
              hint: 'Start Date',
              startEnd: 'start',
              controller: taskController.startTimeController.value,
            ),
            SizedBox(
              height: Dimens.space18,
            ),
            const TextFieldTitleWidget(
              title: 'End Date',
            ),
            SizedBox(
              height: Dimens.space10,
            ),
            TextFieldWidget(
              hint: 'End Date',
              startEnd: 'end',
              controller: taskController.endTimeController.value,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ConstrainedBox(
        constraints:
            BoxConstraints.tightFor(width: Get.width, height: Dimens.space50),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryTextColor,
            shadowColor: Colors.black,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(0.0),
                topLeft: Radius.circular(0.0),
              ),
            ),
          ),
          onPressed: () async {
            final dataToSave = TaskModel(
              title: taskController.titleController.value.text,
              startDate: TimeConverter.stringToDate(
                taskController.startTimeController.value.text,
              ),
              endDate: TimeConverter.stringToDate(
                taskController.endTimeController.value.text,
              ),
              status: widget.taskModel == null
                  ? false.obs
                  : (widget.taskModel!.status),
            );

            if (widget.taskModel == null) {
              await ApiHelper.addtask(dataToSave);
            } else {
              await ApiHelper.updateTask(
                widget.docId ?? '',
                dataToSave.toJson(),
              );
            }
          },
          child: Text(
            widget.taskModel == null ? 'Create Now' : 'Update Info',
            style:
                TextStyle(color: AppColors.whiteColor, fontSize: Dimens.body1),
          ),
        ),
      ),
    );
  }
}
