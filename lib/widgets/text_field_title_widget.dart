import 'package:flutter/material.dart';

import '../global/app_color.dart';
import '../global/dimens.dart';

class TextFieldTitleWidget extends StatelessWidget {
  final String title;
  const TextFieldTitleWidget({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: Dimens.h7,
        fontWeight: FontWeight.bold,
        color: AppColors.secondaryTextColor,
      ),
    );
  }
}
