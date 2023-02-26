// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Category {
  final String name;
  final String picture;

  Category({
    required this.name,
    required this.picture,
  });

  Category copyWith({
    String? name,
    String? picture,
  }) {
    return Category(
      name: name ?? this.name,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'picture': picture,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      picture: map['picture'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Category.fromJson(String source) =>
      Category.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Category(name: $name, picture: $picture)';

  @override
  bool operator ==(covariant Category other) {
    if (identical(this, other)) return true;

    return other.name == name && other.picture == picture;
  }

  @override
  int get hashCode => name.hashCode ^ picture.hashCode;
}
