import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/api_helper.dart';
import '../global/dimens.dart';

class DialogWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool isFailed;
  final String? docId;

  const DialogWidget({
    Key? key,
    required this.title,
    required this.subtitle,
    this.isFailed = false,
    this.docId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: SizedBox(
        height: Get.height / 6,
        child: Column(
          children: [
            Icon(
              isFailed ? Icons.warning : Icons.check_circle,
              size: Dimens.space60,
              color: isFailed ? Colors.orangeAccent : Colors.green,
            ),
            SizedBox(height: Dimens.space10),
            Text(
              subtitle,
              style: TextStyle(fontSize: Dimens.body1),
            ),
          ],
        ),
      ),
      actions: (docId != '')
          ? [
              TextButton(
                onPressed: () => Navigator.pop(context, 'Cancel'),
                child: const Text(
                  'No',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context, 'OK');
                  ApiHelper.deleteTask(docId ?? '');
                },
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ]
          : [],
    );
  }
}
