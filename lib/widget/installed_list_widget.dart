import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/data/istalled_item_list.dart';
import 'package:glassmorphism/model/item_model.dart';
import 'package:glassmorphism/utils/button_widget.dart';
import 'package:glassmorphism/utils/colors.dart';
import 'package:glassmorphism/utils/dimension.dart';
import 'package:glassmorphism/utils/extension.dart';
import 'package:glassmorphism/widget/app_update_dialog.dart';

class InstalledListWidget extends StatefulWidget {
  const InstalledListWidget({super.key});

  @override
  State<InstalledListWidget> createState() => _InstalledListWidgetState();
}

class _InstalledListWidgetState extends State<InstalledListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white.withOpacity(.07),
        border: Border.all(color: Colors.black54, width: .7),
      ),
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final itemModel = installedItemList[index];
          return _installedItem(
            itemModel: itemModel,
            onTap: () {},
          );
        },
        separatorBuilder: (context, index) => _divider(),
        itemCount: installedItemList.length,
      ),
    );
  }

  Widget _installedItem({required ItemModel itemModel, required void Function() onTap}) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(itemModel.radiusBottomLeft),
          bottomRight: Radius.circular(itemModel.radiusBottomRight),
          topRight: Radius.circular(itemModel.radiusTopRight),
          topLeft: Radius.circular(itemModel.radiusTopLeft),
        ),
        hoverColor: AppColor.blackColor.withOpacity(.3),
        focusColor: AppColor.blackColor.withOpacity(.1),
        highlightColor: AppColor.blackColor.withOpacity(.1),
        splashColor: AppColor.blackColor.withOpacity(.1),
        child: Padding(
          padding: Dimensions.p10.copyWith(right: 0, top: 6, bottom: 6),
          child: Row(
            children: [
              Dimensions.w5,
              SizedBox(
                height: 28,
                width: 28,
                child: SvgPicture.asset(itemModel.imageSvg ?? ""),
              ),
              Dimensions.w10,
              Expanded(
                flex: 1,
                child: Text(
                  itemModel.title,
                  style: const TextStyle(fontSize: 14, color: AppColor.whiteColor),
                ),
              ),
              _itemStatus(itemModel: itemModel),
              _itemTrailing(itemModel: itemModel),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemStatus({required ItemModel itemModel}) {
    if (context.isMobileWidth()) {
      return const SizedBox();
    }
    return Expanded(
      child: Row(
        children: [
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: itemModel.isUpdated() ? Colors.green.shade400 : AppColor.primary,
            ),
          ),
          Dimensions.w8,
          Expanded(
            child: Text(
              itemModel.isUpdated() ? "Updated" : "Update Available",
              style: const TextStyle(fontSize: 14, color: AppColor.whiteColor),
            ),
          )
        ],
      ),
    );
  }

  Widget _itemTrailing({required ItemModel itemModel}) {
    return SizedBox(
      width: context.isMobileWidth() ? null : 190,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          RoundedButton(
            text: itemModel.isUpdated() ? "Open" : "Update this app",
            fontWeight: FontWeight.w400,
            fontSize: context.isSmallDeviceWidth() ? 12 : 13,
            height: 30,
            borderRadius: 100,
            hoverColor: itemModel.isUpdated() ? Colors.white24 : AppColor.buttonPrimaryHover,
            color: itemModel.isUpdated() ? Colors.transparent : AppColor.buttonPrimary,
            elevation: 0,
            borderColor: itemModel.isUpdated() ? Colors.white70 : null,
            padding: EdgeInsets.symmetric(horizontal: context.isSmallDeviceWidth() ? 7 : 15),
            onTap: () {
              if (!itemModel.isUpdated()) {
                showDialog(context: context, builder: (context) => const AppUpdateDialog());
              }
            },
            textColor: itemModel.isUpdated() ? Colors.white70 : AppColor.whiteColor,
          ),
          PopupMenuButton(
            icon: Icon(
              Icons.more_horiz,
              color: Colors.white70,
              size: context.isSmallDeviceWidth()
                  ? 20
                  : context.isMobileWidth()
                      ? 25
                      : 30,
            ),
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
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          ),
        ],
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
