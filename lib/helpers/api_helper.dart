import 'package:cloud_firestore/cloud_firestore.dart';

import 'dialog_helper.dart';
import '../models/task_model.dart';

class ApiHelper {
  // communicate with collection from Firebase
  static CollectionReference taskDb =
      FirebaseFirestore.instance.collection('task');

  static Future<void> addtask(TaskModel data) {
    return taskDb
        .add(
          data.toJson(),
        )
        .then(
          (value) => DialogHelper.showModal(
            'Success',
            'Your task was added to the database',
          ),
        )
        .catchError(
          (error) => DialogHelper.showModal(
            'Failed',
            '$error',
            isFailed: true,
          ),
        );
  }

  static Future<void> updateTask(String docId, Map<String, Object?> data) {
    return taskDb
        .doc(docId)
        .update(data)
        .then(
          (value) => DialogHelper.showModal(
            'Success',
            'Your task info was updated',
          ),
        )
        .catchError(
          (error) => DialogHelper.showModal(
            'Failed',
            '$error',
            isFailed: true,
          ),
        );
  }

  static Future<void> deleteTask(String docId) {
    return taskDb
        .doc(docId)
        .delete()
        .then(
          (value) => DialogHelper.showModal(
            'Success',
            'Your task was deleted from database',
          ),
        )
        .catchError(
          (error) => DialogHelper.showModal(
            'Failed',
            '$error',
            isFailed: true,
          ),
        );
  }
}
