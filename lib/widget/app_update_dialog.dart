import 'package:flutter/material.dart';
import 'package:glassmorphism/utils/button_widget.dart';
import 'package:glassmorphism/utils/colors.dart';
import 'package:glassmorphism/utils/dimension.dart';
import 'package:glassmorphism/utils/extension.dart';

class AppUpdateDialog extends StatefulWidget {
  const AppUpdateDialog({super.key});

  @override
  State<AppUpdateDialog> createState() => _AppUpdateDialogState();
}

class _AppUpdateDialogState extends State<AppUpdateDialog> {
  bool isChecked1 = false;
  bool isChecked2 = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.bgPurpleColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      contentPadding: Dimensions.p20,
      content: SizedBox(
        width: context.width() < 500
            ? 360
            : context.width() < 700
                ? 500
                : 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Expanded(
                  child: Text(
                    "Update This App",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 20,
                    margin: Dimensions.p5,
                    width: 20,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.white)),
                    alignment: Alignment.center,
                    child: const Icon(Icons.close, size: 14, color: Colors.white),
                  ),
                ),
              ],
            ),
            Dimensions.h10,
            const Divider(color: Colors.white24),
            Dimensions.h10,
            const Text.rich(
              TextSpan(
                style: TextStyle(height: 1.8),
                children: [
                  TextSpan(
                    text: "Adjust your selections for advanced options as desired before continuing. ",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                  TextSpan(
                    text: "Learn more",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ],
              ),
            ),
            Dimensions.h10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked1,
                  onChanged: (value) {
                    isChecked1 = value ?? false;
                    setState(() {});
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    side: const BorderSide(color: Colors.white),
                  ),
                  activeColor: AppColor.primary,
                  checkColor: AppColor.whiteColor,
                  side: const BorderSide(color: Colors.white),
                ),
                Dimensions.w10,
                const Expanded(
                  child: Text(
                    "Import previous settings and preferences",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Dimensions.h10,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Checkbox(
                  value: isChecked2,
                  onChanged: (value) {
                    isChecked2 = value ?? false;
                    setState(() {});
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                    side: const BorderSide(color: Colors.white),
                  ),
                  activeColor: AppColor.primary,
                  checkColor: AppColor.whiteColor,
                  side: const BorderSide(color: Colors.white),
                ),
                Dimensions.w10,
                const Expanded(
                  child: Text(
                    "Remove old versions",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
            Dimensions.h20,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RoundedButton(
                  text: "Cancel",
                  fontWeight: FontWeight.w400,
                  fontSize: context.isSmallDeviceWidth() ? 12 : 13,
                  height: 30,
                  borderRadius: 100,
                  hoverColor: Colors.white24,
                  color: Colors.transparent,
                  elevation: 0,
                  borderColor: Colors.white70,
                  padding: EdgeInsets.symmetric(horizontal: context.isSmallDeviceWidth() ? 7 : 15),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  textColor: Colors.white70,
                ),
                Dimensions.w10,
                RoundedButton(
                  text: "Update",
                  fontWeight: FontWeight.w400,
                  fontSize: context.isSmallDeviceWidth() ? 12 : 13,
                  height: 30,
                  borderRadius: 100,
                  hoverColor: AppColor.buttonPrimaryHover,
                  color: AppColor.buttonPrimary,
                  elevation: 0,
                  padding: EdgeInsets.symmetric(horizontal: context.isSmallDeviceWidth() ? 7 : 15),
                  onTap: () {
                    Navigator.pop(context);
                  },
                  textColor: AppColor.whiteColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
