import 'package:glassmorphism/model/item_model.dart';
import 'package:glassmorphism/utils/image.dart';

List<ItemModel> installedItemList = [
  ItemModel(
    title: "Photoshop",
    imageSvg: Images.icPs,
    itemStatus: ItemStatus.updated,
    radiusTopLeft: 15,
    radiusTopRight: 15,
  ),
  ItemModel(
    title: "Illustrator",
    imageSvg: Images.icAi,
    itemStatus: ItemStatus.available,
  ),
  ItemModel(
    title: "After Effects",
    imageSvg: Images.icAe,
    radiusBottomLeft: 15,
    radiusBottomRight: 15,
    itemStatus: ItemStatus.updated,
  ),
];
