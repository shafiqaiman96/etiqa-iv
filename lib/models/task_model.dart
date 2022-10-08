import 'package:get/get.dart';

class TaskModel {
  String title;
  DateTime startDate, endDate;
  RxBool status;
  String timeLeft() {
    int totalHours = (endDate.difference(DateTime.now()).inHours + 1);
    int getMinutes = 60 - DateTime.now().minute;

    return totalHours.isNegative
        ? 'Date passed'
        : '${totalHours.floor()} hrs ${getMinutes.toString()} min';
  }

  TaskModel({
    required this.title,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) => TaskModel(
        title: json['title'],
        startDate: DateTime.parse(json['startDate']),
        endDate: json['endDate'] == null
            ? json['endDate']
            : DateTime.parse(json['endDate']),
        status: json['status'] == false ? false.obs : true.obs,
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'startDate': startDate.toIso8601String(),
        'endDate': endDate.toIso8601String(),
        'status': status.value,
      };
}
