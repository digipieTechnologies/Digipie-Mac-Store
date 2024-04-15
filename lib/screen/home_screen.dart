import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:glassmorphism/utils/cache_network_image.dart';
import 'package:glassmorphism/utils/colors.dart';
import 'package:glassmorphism/utils/dimension.dart';
import 'package:glassmorphism/utils/extension.dart';
import 'package:glassmorphism/utils/image.dart';
import 'package:glassmorphism/utils/text_field.dart';
import 'package:glassmorphism/widget/adobe_stock_widget.dart';
import 'package:glassmorphism/widget/app_grid_widget.dart';
import 'package:glassmorphism/widget/installed_list_widget.dart';
import 'package:glassmorphism/widget/tab_widget.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late TabController tabController;
  late TabController headerController;

  bool onFieldTap = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    headerController = TabController(length: 4, vsync: this);
    tabController.addListener(() => setState(() {}));
    headerController.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          onFieldTap = false;
          setState(() {});
        },
        child: Stack(
          children: [
            _bgAnimation(),
            _rootWidget(),
          ],
        ),
      ),
    );
  }

  Widget _bgAnimation() {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: Lottie.asset(
        Images.bgAnimation,
        fit: BoxFit.fill,
        repeat: true,
      ),
    );
  }

  Widget _rootWidget() {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 9, sigmaY: 9),
      child: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(
          horizontal: context.width() < 500
              ? 20
              : context.width() < 500
                  ? 20
                  : (context.width() * .1),
          vertical: 50,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black45,
        ),
        child: Row(
          children: [
            if (context.isDesktopWidth()) ...[
              _drawerWidget(),
            ],
            Expanded(
              child: Column(
                children: [
                  _appbar(),
                  _divider(),
                  _tabBar(),
                  _bodyWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _appbar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // height: 60,
      alignment: onFieldTap ? Alignment.center : Alignment.bottomCenter,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (!onFieldTap) ...[
            _headerTabBar(),
          ],
          _searchField(),
          if (!onFieldTap) ...[
            Dimensions.w10,
            _notification(),
            Dimensions.w10,
            _userImage(),
          ],
        ],
      ),
    );
  }

  Widget _drawerWidget() {
    return Container(
      padding: Dimensions.p16,
      width: 250,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Dimensions.h65,
            _headingText('Apps'),
            _menuItem(
              icon: Images.icMenu,
              text: "All Apps",
              onTap: () {},
              iconSize: 16,
            ),
            _menuItem(
              icon: Images.icRedo,
              text: "Updates",
              onTap: () {},
              iconSize: 18,
              count: 3,
            ),
            Dimensions.h20,
            _headingText('Category'),
            _menuItem(
              icon: Images.icCamera,
              text: "Photography",
              onTap: () {},
              iconSize: 20,
            ),
            _menuItem(
              icon: Images.icShape,
              text: "Graphic Design",
              onTap: () {},
              iconSize: 18,
            ),
            _menuItem(
              icon: Images.icVideo,
              text: "Video",
              onTap: () {},
              iconSize: 18,
            ),
            _menuItem(
              icon: Images.icPaint,
              text: "Illustrator",
              onTap: () {},
              iconSize: 18,
            ),
            _menuItem(
              icon: Images.icSystem,
              text: "UI / UX",
              onTap: () {},
              iconSize: 18,
            ),
            _menuItem(
              icon: Images.icLayer,
              text: "3D / AR",
              onTap: () {},
              iconSize: 20,
            ),
            Dimensions.h20,
            _headingText('Fonts'),
            _menuItem(
              icon: Images.icFont,
              text: "Manage fonts",
              onTap: () {},
              iconSize: 20,
            ),
            Dimensions.h20,
            _headingText('Resource Links'),
            _menuItem(
              icon: Images.icStock,
              text: "Stock",
              onTap: () {},
              isColorable: false,
              iconSize: 20,
            ),
            _menuItem(
              icon: Images.icGraduate,
              text: "Tutorials",
              onTap: () {},
              iconSize: 20,
            ),
            _menuItem(
              icon: Images.icPf,
              text: "Portfolio",
              isColorable: false,
              onTap: () {},
              iconSize: 20,
            ),
            _menuItem(
              icon: Images.icBh,
              text: "Behance",
              isColorable: false,
              onTap: () {},
              count: 2,
              iconSize: 20,
            ),
            _menuItem(
              icon: Images.icMessage,
              text: "Social Forum",
              onTap: () {},
              iconSize: 20,
            ),
            Dimensions.h20,
          ],
        ),
      ),
    );
  }

  Widget _tabBar() {
    return SizedBox(
      height: 55,
      child: Material(
        color: Colors.transparent,
        child: TabBar(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          controller: tabController,
          tabs: [
            _tabWidget(
              label: "Desktop",
              isSelected: tabController.index == 0,
            ),
            _tabWidget(
              label: "Mobile",
              isSelected: tabController.index == 1,
            ),
            _tabWidget(
              label: "Web",
              isSelected: tabController.index == 2,
            ),
          ],
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          unselectedLabelColor: AppColor.whiteColor.withOpacity(.5),
          labelColor: AppColor.whiteColor,
          dividerColor: AppColor.whiteColor.withOpacity(.2),
          indicatorColor: AppColor.whiteColor,
        ),
      ),
    );
  }

  Widget _divider() {
    return Divider(
      height: 0,
      color: Colors.white.withOpacity(.2),
    );
  }

  Widget _notification() {
    return SizedBox(
      height: 30,
      width: 30,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          const Icon(
            Icons.notifications,
            color: Colors.white,
            size: 25,
          ),
          Container(
            height: 15,
            width: 15,
            alignment: Alignment.center,
            decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColor.primary),
            child: const Text(
              "3",
              style: TextStyle(color: Colors.white, fontSize: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _userImage() {
    return AppNetWorkImage(
      imageUrl: "https://www.shareicon.net/data/2017/01/06/868320_people_512x512.png",
      height: 32,
      weight: 32,
      radius: 100,
      border: Border.all(color: Colors.white, width: 2),
    );
  }

  Widget _searchField() {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: onFieldTap ? EdgeInsets.symmetric(horizontal: context.width() * .05, vertical: 5) : Dimensions.vp5,
        child: Container(
          margin: Dimensions.hp20,
          child: TextFormFieldWidget(
            autoFocus: onFieldTap,
            onFieldTap: () {
              onFieldTap = true;
              setState(() {});
            },
            courserColor: AppColor.whiteColor.withOpacity(.8),
            contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.white.withOpacity(.5),
            ),
            fillColor: Colors.black.withOpacity(.5),
            filled: true,
            borderColor: Colors.black.withOpacity(.2),
            borderRadius: 5,
            style: TextStyle(color: AppColor.whiteColor.withOpacity(.8)),
            hintText: "Search",
            hintStyle: TextStyle(color: AppColor.whiteColor.withOpacity(.5)),
          ),
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: Colors.black26,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: context.isMobileWidth() ? 20 : 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Dimensions.h5,
              const AdobeStockWidget(),
              Dimensions.h20,
              _headingText("Installed"),
              Dimensions.h12,
              const InstalledListWidget(),
              Dimensions.h20,
              _headingText("Apps in your plan"),
              Dimensions.h12,
              const AppGridWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tabWidget({required String label, bool isNotify = false, bool isSelected = false, bool isHide = false}) {
    if (isHide) return const SizedBox();

    return TabWidget(
      label: label,
      isNotify: isNotify,
      isSelected: isSelected,
    );
  }

  Widget _headerTabBar() {
    if (context.isMobileWidth()) {
      return const SizedBox();
    }
    return SizedBox(
      height: 55,
      child: Material(
        color: Colors.transparent,
        child: TabBar(
          overlayColor: MaterialStateProperty.all(Colors.transparent),
          controller: headerController,
          tabs: [
            _tabWidget(
              label: "Apps",
              isSelected: headerController.index == 0,
            ),
            _tabWidget(
              label: "You work",
              isNotify: true,
              isSelected: headerController.index == 1,
              isHide: !context.isDesktopWidth(),
            ),
            _tabWidget(
              label: "Discover",
              isSelected: headerController.index == (context.isDesktopWidth() ? 2 : 1),
            ),
            _tabWidget(
              label: "Market",
              isNotify: true,
              isSelected: headerController.index == 3,
              isHide: !context.isDesktopWidth(),
            ),
          ],
          // labelPadding: EdgeInsets.zero,
          labelPadding: EdgeInsets.symmetric(horizontal: context.isTabletWidth() ? 5 : 12, vertical: 0),
          tabAlignment: TabAlignment.center,
          isScrollable: true,
          unselectedLabelColor: AppColor.whiteColor.withOpacity(.5),
          labelColor: AppColor.whiteColor,
          dividerColor: Colors.transparent,
          indicatorColor: AppColor.whiteColor,
        ),
      ),
    );
  }

  Widget _headingText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white.withOpacity(.4),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _menuItem({
    required String icon,
    required String text,
    required void Function() onTap,
    double iconSize = 20,
    bool isColorable = true,
    int? count,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        hoverColor: AppColor.blackColor.withOpacity(.3),
        focusColor: AppColor.blackColor.withOpacity(.1),
        highlightColor: AppColor.blackColor.withOpacity(.1),
        splashColor: AppColor.blackColor.withOpacity(.1),
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: count != null ? 6 : 10),
          child: Row(
            children: [
              Dimensions.w5,
              Container(
                alignment: Alignment.center,
                height: iconSize,
                width: iconSize,
                child: SvgPicture.asset(
                  icon,
                  fit: BoxFit.contain,
                  color: isColorable ? Colors.white : null,
                ),
              ),
              Dimensions.w10,
              Expanded(
                child: Text(
                  text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white, fontSize: 14),
                ),
              ),
              Dimensions.w10,
              if (count != null) ...[
                Container(
                  padding: Dimensions.p6,
                  decoration: const BoxDecoration(color: AppColor.primary, shape: BoxShape.circle),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
                Dimensions.w10,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
