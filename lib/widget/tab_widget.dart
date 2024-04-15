import 'package:flutter/material.dart';
import 'package:glassmorphism/utils/colors.dart';

class TabWidget extends StatefulWidget {
  const TabWidget({
    super.key,
    required this.label,
    this.isNotify = false,
    this.isSelected = false,
  });

  final String label;
  final bool isNotify;
  final bool isSelected;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: MouseRegion(
        onEnter: (event) {
          isHovered = true;
          setState(() {});
        },
        onExit: (event) {
          isHovered = false;
          setState(() {});
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 12),
              child: Tab(
                text: isHovered ? null : widget.label,
                child: !isHovered
                    ? null
                    : Text(
                        widget.label,
                        style: TextStyle(color: isHovered ? AppColor.whiteColor : Colors.white24),
                      ),
              ),
            ),
            if (widget.isNotify)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                height: 6,
                width: 6,
                decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.primary),
              ),
            if (isHovered && !widget.isSelected)
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 2.7,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
