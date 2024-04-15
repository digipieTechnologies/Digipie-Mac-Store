import 'package:flutter/material.dart';
import 'package:glassmorphism/model/item_model.dart';

extension DoubleX on BuildContext {
  bool isDesktopWidth() {
    return MediaQuery.of(this).size.width >= 1100;
  }

  bool isTabletWidth() {
    return MediaQuery.of(this).size.width >= 700 && MediaQuery.of(this).size.width < 1100;
  }

  bool isMobileWidth() {
    return MediaQuery.of(this).size.width < 700;
  }

  bool isSmallDeviceWidth() {
    return MediaQuery.of(this).size.width < 400;
  }

  double width() {
    return MediaQuery.of(this).size.width;
  }

  double height() {
    return MediaQuery.of(this).size.height;
  }
}

extension ItemModelsX on ItemModel {
  bool isUpdated() {
    return itemStatus == ItemStatus.updated;
  }
}
