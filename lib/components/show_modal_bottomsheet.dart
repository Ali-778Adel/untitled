import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Future showBarModalBottomsheet(
    {required BuildContext context, required Widget widget}) {
  return showBarModalBottomSheet(
    expand: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      context: context,
      builder: (context) {
        return widget;
      });
}
