import 'package:get/get.dart';

import '../widgets/dialog_widget.dart.dart';

class DialogHelper {
  static Future<void> showModal(
    String title,
    String subtitle, {
    bool? isFailed,
    String? docId,
  }) async {
    Get.dialog(
      DialogWidget(
        title: title,
        subtitle: subtitle,
        isFailed: isFailed ?? false,
        docId: docId ?? '',
      ),
    );
    if (docId == null) {
      Future.delayed(const Duration(seconds: 1)).then((value) => Get.back());
    }
  }
}
