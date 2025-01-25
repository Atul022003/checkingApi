class ReviewModal {
  String? status;
  String? message;
  List<Review>? data;  // data can be null or an empty list

  // Constructor
  ReviewModal({this.status, this.message, this.data});

  // From JSON
  factory ReviewModal.fromJson(Map<String, dynamic> json) {
    return ReviewModal(
      status: json['status'],
      message: json['message'],
      // Check if 'data' exists and if it's null, return an empty list
      data: json['data'] != null ? List<Review>.from(json['data'].map((x) => Review.fromJson(x))) : [],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data?.map((x) => x.toJson()).toList(),
    };
  }
}

class Review {
  String? reviewerName;
  String? reviewText;

  // Constructor
  Review({this.reviewerName, this.reviewText});

  // From JSON
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      reviewerName: json['reviewerName'],
      reviewText: json['reviewText'],
    );
  }

  // To JSON
  Map<String, dynamic> toJson() {
    return {
      'reviewerName': reviewerName,
      'reviewText': reviewText,
    };
  }
}
