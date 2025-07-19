import 'package:flutter/material.dart';
import 'package:mini_task_manager/utils/color_manager.dart';

class BasicTextField extends StatelessWidget {
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool readOnly;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  const BasicTextField({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.onTap,
    this.readOnly = false,
    this.onChanged,
  });
  static const inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: ColorManager.accent),
  );

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: readOnly,
      onChanged: onChanged,
      style: TextStyle(color: ColorManager.primaryText, fontSize: 16),
      decoration: InputDecoration(
        border: BasicTextField.inputBorder,
        enabledBorder: BasicTextField.inputBorder,
        focusedBorder: BasicTextField.inputBorder,
        labelText: label,
        floatingLabelStyle: TextStyle(
          color: ColorManager.accent,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        labelStyle: TextStyle(color: Color(0xFF6C6D89), fontSize: 16),
      ),
    );
  }
}
