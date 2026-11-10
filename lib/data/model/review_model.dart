class ReviewModel {
  double rating;
  String comment;
  DateTime? date;
  String reviewerName;
  String reviewerEmail;

  ReviewModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerEmail,
    required this.reviewerName,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      rating: (json['rating'] as num).toDouble(),
      comment: json['comment'] as String,
      date: DateTime.tryParse(json['date'] as String),
      reviewerName: json['reviewerName'] as String,
      reviewerEmail: json['reviewerEmail'] as String,
    );
  }
}
