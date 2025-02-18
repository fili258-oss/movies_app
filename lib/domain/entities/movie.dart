class Movie{
  final String id;
  final String title;
  final double price;
  final String description;
  final String imageUrl;
  final double rating;
  final String releaseDate;

  Movie({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.imageUrl,
    required this.rating,
    required this.releaseDate,
  });

  Movie copyWith({
    String? id,
    String? title,
    double? price,
    String? description,
    String? imageUrl,
    double? rating,
    String? releaseDate,
  }) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      price: price ?? this.price,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      rating: rating ?? this.rating,
      releaseDate: releaseDate ?? this.releaseDate,
    );
  }
}