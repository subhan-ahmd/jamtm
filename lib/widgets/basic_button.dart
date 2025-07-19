import 'package:flutter/material.dart';
import 'package:mini_task_manager/utils/color_manager.dart';

class BasicButton extends StatelessWidget {
  final String data;
  final void Function()? onPressed;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final bool maxButton;
  const BasicButton({
    super.key,
    required this.data,
    required this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.maxButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(horizontal: 8, vertical: maxButton ? 12 : 0),
        ),
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
        minimumSize: WidgetStateProperty.all(Size(double.maxFinite, 55)),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        side: WidgetStateProperty.all(
          BorderSide(color: borderColor ?? ColorManager.accent, width: 1.0),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
      child: Text(
        data,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: textColor ?? ColorManager.primaryText,
          fontWeight: FontWeight.w500,
          fontSize: 14,
        ),
      ),
    );
  }
}
