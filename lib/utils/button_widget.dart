import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/utils/colors.dart';
import 'package:glassmorphism/utils/dimension.dart';

const double buttonHeight45 = 45;
const double buttonHeight48 = 48;
const double buttonHeight50 = 55;

class RoundedButton extends StatelessWidget {
  RoundedButton({
    super.key,
    this.borderColor,
    this.onTap,
    this.hoverColor,
    this.borderWidth,
    this.image,
    this.width,
    this.padding,
    this.alignment = Alignment.center,
    this.bottomBorderColor,
    this.color = AppColor.primary,
    this.textColor = AppColor.whiteColor,
    this.shadowColor = Colors.black87,
    this.height = buttonHeight50,
    this.borderRadius = 8,
    this.elevation = 5,
    this.hMargin = 0,
    this.vMargin = 0,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w400,
    this.textExpandable = false,
    this.isForward = false,
    this.isSvg = false,
    required this.text,
  });

  final String text;
  final Color color;
  final double height;
  final double borderRadius;
  final double hMargin;
  final double elevation;
  final double vMargin;
  final bool textExpandable;
  final Alignment alignment;
  final double fontSize;

  final Color textColor;
  final Color shadowColor;

  double? width;
  double? borderWidth;
  Color? borderColor;
  Color? hoverColor;
  Color? bottomBorderColor;
  EdgeInsetsGeometry? padding;
  String? image;
  GestureTapCallback? onTap;
  final bool isSvg;
  final bool isForward;

  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: hMargin, vertical: vMargin),
      child: Material(
        elevation: elevation,
        color: Colors.transparent,
        shadowColor: shadowColor,
        borderRadius: BorderRadius.circular(borderRadius),
        child: InkWell(
          hoverColor: hoverColor,
          focusColor: hoverColor?.withOpacity(.1),
          highlightColor: hoverColor?.withOpacity(.1),
          splashColor: hoverColor?.withOpacity(.1),
          borderRadius: BorderRadius.circular(borderRadius),
          onTap: onTap,
          child: Container(
            width: width,
            height: height,
            padding: padding,
            decoration: BoxDecoration(
              color: color,
              border: bottomBorderColor != null
                  ? Border(
                      bottom: BorderSide(color: bottomBorderColor!, width: 2),
                      right: BorderSide(color: bottomBorderColor!, width: 0),
                      top: BorderSide(color: bottomBorderColor!, width: 0),
                      left: BorderSide(color: bottomBorderColor!, width: 0),
                    )
                  : Border.all(
                      color: borderColor ?? color,
                      width: borderWidth ?? 1,
                    ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            alignment: alignment,
            child: image != null
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      textExpandable ? const SizedBox(width: 15) : const SizedBox(),
                      !isSvg
                          ? Image.asset(image!, height: 30, width: 30)
                          : SvgPicture.asset(image!, width: 20, height: 20, color: AppColor.primary),
                      Dimensions.w10,
                      Expanded(
                        flex: textExpandable ? 1 : 0,
                        child:
                            Text(text, style: TextStyle(color: textColor, fontWeight: fontWeight, fontSize: fontSize)),
                      ),
                    ],
                  )
                : Text(text, style: TextStyle(color: textColor, fontWeight: fontWeight, fontSize: fontSize)),
          ),
        ),
      ),
    );
  }
}
