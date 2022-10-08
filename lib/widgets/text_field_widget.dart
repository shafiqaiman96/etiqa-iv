import 'package:flutter/material.dart';
import '../global/app_color.dart';
import '../helpers/time_picker.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? startEnd;
  final int? minLine;
  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.hint,
    this.startEnd,
    this.minLine,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      minLines: minLine ?? 1,
      maxLines: null,
      readOnly: minLine == null ? true : false,
      decoration: InputDecoration(
        suffixIcon: minLine != null
            ? null
            : const Icon(
                Icons.keyboard_arrow_down,
              ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: AppColors.primaryColor),
        ),
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.primaryTextColor.withOpacity(.3),
        ),
      ),
      onTap: () {
        if (minLine == null) {
          selectDate(context, startEnd);
        }
      },
    );
  }
}
