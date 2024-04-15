import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/utils/button_widget.dart';
import 'package:glassmorphism/utils/colors.dart';
import 'package:glassmorphism/utils/dimension.dart';
import 'package:glassmorphism/utils/extension.dart';
import 'package:glassmorphism/utils/image.dart';

class AdobeStockWidget extends StatefulWidget {
  const AdobeStockWidget({super.key});

  @override
  State<AdobeStockWidget> createState() => _AdobeStockWidgetState();
}

class _AdobeStockWidgetState extends State<AdobeStockWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: AppColor.gridColorList,
          end: Alignment.bottomLeft,
          begin: Alignment.topRight,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: context.width() < 450 ? 10 : 20, vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 28,
                      width: 28,
                      child: SvgPicture.asset(Images.icSt),
                    ),
                    Dimensions.w10,
                    const Expanded(
                      flex: 1,
                      child: Text(
                        "Adobe Stock",
                        style: TextStyle(fontSize: 14, color: AppColor.whiteColor),
                      ),
                    ),
                  ],
                ),
                Dimensions.h12,
                Text(
                  "Grab yourself 10 free images from Adobe Stock ${context.width() >= 755 ? "\n" : ""}in a 30-day free trial plan and find perfect image, ${context.width() >= 755 ? "\n" : ""}that will help you with your new project.",
                  style: TextStyle(fontSize: 13, color: AppColor.whiteColor.withOpacity(.9), height: 1.6),
                ),
                Dimensions.h12,
                IntrinsicWidth(
                  child: RoundedButton(
                    text: "Start free trial",
                    fontWeight: FontWeight.w400,
                    fontSize: context.isSmallDeviceWidth() ? 12 : 13,
                    height: 30,
                    borderRadius: 100,
                    hoverColor: AppColor.buttonPrimaryHover,
                    color: AppColor.buttonPrimary,
                    elevation: 0,
                    padding: EdgeInsets.symmetric(horizontal: context.isSmallDeviceWidth() ? 7 : 15),
                    onTap: () {},
                    textColor: AppColor.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(Images.icGlass, height: context.width() >= 755 ? 150 : 100),
        ],
      ),
    );
  }
}
