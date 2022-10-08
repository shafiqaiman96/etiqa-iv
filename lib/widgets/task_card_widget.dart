import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../global/app_color.dart';
import '../global/dimens.dart';
import '../helpers/dialog_helper.dart';
import '../helpers/time_converter.dart';
import '../models/task_model.dart';
import '../helpers/api_helper.dart';
import 'custom_container.dart';

class TaskCard extends StatelessWidget {
  final TaskModel taskModel;
  final String docId;
  const TaskCard({
    Key? key,
    required this.taskModel,
    required this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Padding(
        padding: EdgeInsets.all(
          Dimens.space16,
        ),
        child: Stack(
          children: [
            AppContainer(
              widget: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(
                      Dimens.space16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          taskModel.title,
                          style: TextStyle(
                            fontSize: Dimens.body1,
                            fontWeight: FontWeight.bold,
                            color: AppColors.primaryTextColor,
                          ),
                        ),
                        SizedBox(height: Dimens.space14),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            for (int i = 0; i < 3; i++) ...[
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    i == 0
                                        ? 'Start Date'
                                        : i == 1
                                            ? 'End Date'
                                            : 'Time Left',
                                    style: TextStyle(
                                      fontSize: Dimens.caption,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.secondaryTextColor,
                                    ),
                                  ),
                                  SizedBox(height: Dimens.space6),
                                  Text(
                                    i == 2
                                        ? taskModel.timeLeft()
                                        : TimeConverter.getProperDate(
                                            i == 0
                                                ? taskModel.startDate
                                                : taskModel.endDate,
                                          ),
                                    style: TextStyle(
                                      fontSize: Dimens.caption,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.primaryTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.secondaryColor,
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(Dimens.space10),
                        bottomLeft: Radius.circular(Dimens.space10),
                      ),
                    ),
                    height: Dimens.space30,
                    width: Get.width - (Dimens.space32),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimens.space16,
                      ),
                      child: Row(
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              fontSize: Dimens.caption,
                              color: AppColors.secondaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: Dimens.space10),
                          Text(
                            !taskModel.status.value
                                ? 'Incomplete'
                                : 'Completed',
                            style: TextStyle(
                              fontSize: Dimens.caption,
                              color: AppColors.primaryTextColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Tick if completed',
                            style: TextStyle(
                              fontSize: Dimens.caption,
                              color: AppColors.primaryTextColor,
                            ),
                          ),
                          SizedBox(width: Dimens.space10),
                          Transform.scale(
                            scale: .8,
                            child: Container(
                              width: 14,
                              height: 14,
                              color: AppColors.whiteColor,
                              child: Checkbox(
                                checkColor: AppColors.whiteColor,
                                value: taskModel.status.value,
                                activeColor: AppColors.primaryColor,
                                onChanged: (bool? newValue) {
                                  taskModel.status.value = newValue!;
                                  final dataToSave = TaskModel(
                                    title: taskModel.title,
                                    startDate: taskModel.startDate,
                                    endDate: taskModel.endDate,
                                    status: taskModel.status,
                                  );

                                  ApiHelper.updateTask(
                                    docId,
                                    dataToSave.toJson(),
                                  );
                                },
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Positioned(
              right: Dimens.space1,
              top: Dimens.space1,
              child: IconButton(
                icon: const Icon(
                  Icons.clear,
                  color: Colors.red,
                ),
                onPressed: () {
                  DialogHelper.showModal(
                    'Warning',
                    'Are you sure to delete this task?',
                    docId: docId,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
