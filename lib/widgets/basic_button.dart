import 'package:flutter/material.dart';
import 'package:mini_task_manager/utils/color_manager.dart';

class BasicButton extends StatelessWidget {
  final String data;
  final void Function()? onPressed;
  final Color? borderColor;
  final Color? backgroundColor;
  final Color? textColor;
  final bool maxButton;
  final Size? buttonSize;
  final bool noPadding;
  final Widget? icon;
  const BasicButton({
    super.key,
    required this.data,
    required this.onPressed,
    this.borderColor,
    this.backgroundColor,
    this.textColor,
    this.maxButton = false,
    this.noPadding = true,
    this.buttonSize,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        padding: WidgetStateProperty.all(
          noPadding?EdgeInsets.zero:EdgeInsets.symmetric(horizontal: 8, vertical: maxButton ? 12 : 4),
        ),
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        backgroundColor: WidgetStateProperty.all(backgroundColor),
        surfaceTintColor: WidgetStateProperty.all(Colors.transparent),
        minimumSize: maxButton
                ? WidgetStateProperty.all(Size(double.infinity, 55))
                : (buttonSize != null
                    ? WidgetStateProperty.all(buttonSize ?? const Size(146, 44))
                    : WidgetStateProperty.all(Size(80, 45))),
        shadowColor: WidgetStateProperty.all(Colors.transparent),
        side: WidgetStateProperty.all(
          BorderSide(color: borderColor ?? ColorManager.accent, width: 1.0),
        ),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
      ),
      child: icon == null
              ? Text(
                data,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: textColor ?? ColorManager.primaryText,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                spacing: icon != null ? 8 : 0,
                children: [
                  icon ?? Container(),
                  if(data.isNotEmpty)
                  Text(
                    data,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: textColor ?? ColorManager.primaryText,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
    );
  }
}
