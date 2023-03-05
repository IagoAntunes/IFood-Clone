// ignore_for_file: public_member_api_docs, sort_constructors_first
class Restaurant {
  final String name;
  final String category;
  final String deliveryTax;
  final String distance;
  final double rate;
  final List<int> time;
  final bool favorite;
  final String photoUrl;
  Restaurant({
    required this.name,
    required this.category,
    required this.deliveryTax,
    required this.distance,
    required this.rate,
    required this.time,
    required this.favorite,
    required this.photoUrl,
  });

  Restaurant copyWith({
    String? name,
    String? category,
    String? deliveryTax,
    String? distance,
    double? rate,
    List<int>? time,
    bool? favorite,
    String? photoUrl,
  }) {
    return Restaurant(
      name: name ?? this.name,
      category: category ?? this.category,
      deliveryTax: deliveryTax ?? this.deliveryTax,
      distance: distance ?? this.distance,
      rate: rate ?? this.rate,
      time: time ?? this.time,
      favorite: favorite ?? this.favorite,
      photoUrl: photoUrl ?? this.photoUrl,
    );
  }
}
