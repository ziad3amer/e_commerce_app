class MetaModel {
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String barcode;
  final String qrCode;

  const MetaModel({
  required this.createdAt,
  required this.updatedAt,
  required this.barcode,
  required this.qrCode,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) {
    return MetaModel(
      createdAt: DateTime.tryParse(json['createdAt'] as String? ?? ''),
      updatedAt: DateTime.tryParse(json['updatedAt'] as String? ?? ''),
      barcode: json['barcode'] as String,
      qrCode: json['qrCode'] as String,
    );
  }
}