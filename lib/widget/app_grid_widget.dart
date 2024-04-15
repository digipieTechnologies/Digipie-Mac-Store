import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/data/grid_item_list.dart';
import 'package:glassmorphism/model/item_model.dart';
import 'package:glassmorphism/utils/button_widget.dart';
import 'package:glassmorphism/utils/colors.dart';
import 'package:glassmorphism/utils/dimension.dart';
import 'package:glassmorphism/utils/extension.dart';
import 'package:glassmorphism/widget/app_update_dialog.dart';

class AppGridWidget extends StatefulWidget {
  const AppGridWidget({super.key});

  @override
  State<AppGridWidget> createState() => _AppGridWidgetState();
}

class _AppGridWidgetState extends State<AppGridWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: context.isDesktopWidth()
            ? 3
            : context.isTabletWidth()
                ? 2
                : 1,
        mainAxisSpacing: 15,
        crossAxisSpacing: 15,
        mainAxisExtent: 200,
      ),
      itemBuilder: (context, index) {
        final model = appItemList[index];
        return _gridItemWidget(itemModel: model);
      },
      shrinkWrap: true,
      itemCount: appItemList.length,
    );
  }

  Widget _gridItemWidget({required ItemModel itemModel}) {
    double borderRadius = 15;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(borderRadius),
        hoverColor: AppColor.blackColor.withOpacity(.4),
        focusColor: AppColor.blackColor.withOpacity(.1),
        highlightColor: AppColor.blackColor.withOpacity(.1),
        splashColor: AppColor.blackColor.withOpacity(.1),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(borderRadius),
            color: Colors.white.withOpacity(.07),
            border: Border.all(color: Colors.black54, width: .7),
          ),
          padding: Dimensions.p16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: SvgPicture.asset(itemModel.imageSvg ?? ""),
                  ),
                  Dimensions.w10,
                  Expanded(
                    flex: 1,
                    child: Text(
                      itemModel.title,
                      style: const TextStyle(fontSize: 15, color: AppColor.whiteColor),
                    ),
                  ),
                ],
              ),
              Dimensions.h20,
              Expanded(
                child: Text(
                  itemModel.other,
                  style: TextStyle(fontSize: 14, color: AppColor.whiteColor.withOpacity(.9)),
                ),
              ),
              _divider(),
              Dimensions.h8,
              _itemTrailing(itemModel: itemModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 0,
      thickness: .7,
      color: Colors.white.withOpacity(.2),
    );
  }

  Widget _itemTrailing({required ItemModel itemModel}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RoundedButton(
          text: itemModel.isUpdated() ? "Open" : "Update",
          fontWeight: FontWeight.w400,
          fontSize: 13,
          height: 30,
          borderRadius: 100,
          hoverColor: itemModel.isUpdated() ? Colors.white24 : AppColor.buttonPrimaryHover,
          color: itemModel.isUpdated() ? Colors.transparent : AppColor.buttonPrimary,
          elevation: 0,
          borderColor: itemModel.isUpdated() ? Colors.white70 : null,
          padding: const EdgeInsets.symmetric(horizontal: 18),
          onTap: () {
            showDialog(context: context, builder: (context) => const AppUpdateDialog());
          },
          textColor: itemModel.isUpdated() ? Colors.white70 : AppColor.whiteColor,
        ),
        PopupMenuButton(
          icon: Icon(Icons.more_horiz, color: Colors.white70, size: context.isMobileWidth() ? 25 : 30),
          iconSize: 20,
          onSelected: (value) {},
          itemBuilder: (BuildContext bc) {
            return [
              _popMenuItem(
                title: "Go to Discover",
                value: "/discover",
                iSDivider: true,
              ),
              _popMenuItem(
                title: "Learn more",
                value: "/learnMore",
                iSDivider: true,
                height: 35,
              ),
              _popMenuItem(
                title: "Uninstall",
                value: "/uninstall",
                iSDivider: false,
              ),
            ];
          },
          padding: EdgeInsets.zero,
          color: Colors.black.withOpacity(.7),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ],
    );
  }

  PopupMenuItem _popMenuItem({
    required String value,
    required String title,
    bool iSDivider = false,
    double height = 15,
  }) {
    final labelTextStyle = MaterialStatePropertyAll(
      TextStyle(
        color: Colors.white.withOpacity(.9),
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
    return PopupMenuItem(
      value: value,
      padding: EdgeInsets.zero,
      height: height,
      enabled: false,
      labelTextStyle: labelTextStyle,
      child: SizedBox(
        height: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 18, right: 15),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(title),
                ),
              ),
            ),
            if (iSDivider) const Divider(height: 0, color: Colors.white38),
          ],
        ),
      ),
    );
  }
}
