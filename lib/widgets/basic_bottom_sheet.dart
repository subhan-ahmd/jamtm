import 'package:flutter/material.dart';
import 'package:jamtm/utils/theme_manager.dart';

class BasicBottomSheet extends StatelessWidget {
  final Widget? child;
  const BasicBottomSheet({super.key, this.child});

  static Future<void> openSheet(
    BuildContext context,
    Widget bottomSheet, {
    bool isScrollControlled = false,
  }) async {
    await showModalBottomSheet<void>(
        context: context,
        isScrollControlled: isScrollControlled,
        showDragHandle: true,
        builder: (BuildContext context) => bottomSheet);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom,),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SafeArea(
              child: Container(
                padding: EdgeInsets.all(ThemeManager.horizontalPadding),
                child: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
