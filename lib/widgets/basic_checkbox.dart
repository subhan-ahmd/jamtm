import 'package:flutter/material.dart';

class BasicCheckbox extends StatelessWidget {
  final bool? value;
  final void Function(bool?)? onChanged;
  const BasicCheckbox({
    super.key,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: value, onChanged: onChanged);
  }
}
