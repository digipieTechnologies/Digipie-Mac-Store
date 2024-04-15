class ItemModel {
  String? imageSvg;
  final String title;
  final String other;
  final ItemStatus itemStatus;
  final double radiusTopRight;
  final double radiusTopLeft;
  final double radiusBottomRight;
  final double radiusBottomLeft;

  ItemModel({
    this.imageSvg,
    this.radiusBottomLeft = 0 ,
    this.radiusBottomRight = 0 ,
    this.radiusTopLeft = 0 ,
    this.radiusTopRight = 0 ,
    this.title = "",
    this.other = "",
    this.itemStatus = ItemStatus.updated,
  });
}

enum ItemStatus { updated, available }
