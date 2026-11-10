class DimensionsModel {
  double width;
  double height;
  double depth;

  DimensionsModel({
    required this.width,
    required this.height,
    required this.depth,
  });
  factory DimensionsModel.fromJson(Map<String, dynamic> json) {
    return DimensionsModel(
      width: (json['width'] as num?)?.toDouble() ?? 0,
      height: (json['height'] as num?)?.toDouble() ?? 0,
      depth: (json['depth'] as num?)?.toDouble() ?? 0,
    );
  }
}
