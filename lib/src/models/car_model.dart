class Car {
  final String name;
  final String model;
  final String brand;
  final String year;
  final String color;
  final String imageUrl;

  const Car({
    required this.name,
    required this.model,
    required this.brand,
    required this.year,
    required this.color,
    required this.imageUrl,
  });

  @override
  String toString() {
    return 'Car{model: $model, brand: $brand, year: $year, color: $color, imageUrl: $imageUrl}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Car &&
        other.name == name &&
        other.model == model &&
        other.brand == brand &&
        other.year == year &&
        other.color == color &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        model.hashCode ^
        brand.hashCode ^
        year.hashCode ^
        color.hashCode ^
        imageUrl.hashCode;
  }
}
