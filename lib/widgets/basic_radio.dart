import 'package:flutter/material.dart';

class BasicRadio<T> extends StatelessWidget {
  final String label;
  final T value;
  final T? groupValue;
  final void Function(T?)? onChanged;
  const BasicRadio({
    super.key,
    required this.label,
    required this.value,
    this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged?.call(value),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 2,
        children: [
          Radio(value: value, groupValue: groupValue, onChanged: onChanged),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
