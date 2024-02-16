class Car {
  final String model;
  final String brand;
  final String year;
  final String color;
  final String imageUrl;

  const Car({
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
        other.model == model &&
        other.brand == brand &&
        other.year == year &&
        other.color == color &&
        other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return model.hashCode ^
        brand.hashCode ^
        year.hashCode ^
        color.hashCode ^
        imageUrl.hashCode;
  }
}
