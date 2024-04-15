import 'package:glassmorphism/model/item_model.dart';
import 'package:glassmorphism/utils/image.dart';

List<ItemModel> appItemList = [
  ItemModel(
    title: "Premium Pro",
    imageSvg: Images.icPr,
    other: "Edit, master and create fully professional videos",
    itemStatus: ItemStatus.available,
  ),
  ItemModel(
    title: "InDesign",
    imageSvg: Images.icId,
    itemStatus: ItemStatus.available,
    other: "Design and publish great projects & mockups",
  ),
  ItemModel(
    title: "After Effects",
    imageSvg: Images.icAe,
    other: "Industry Standart motion graphics & visual effects",
    itemStatus: ItemStatus.available,
  ),
];
