class Movie {
  final String title;
  final String imageUrl;
  final String year;
  final String duration;
  final String director;

  Movie({required this.title, required this.imageUrl, required this.year, required this.duration , required this.director});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['movie'] ?? 'No Title',
      imageUrl: json['poster'] ?? 'https://picsum.photos/150',
      year: json['year'].toString() ?? 'Unknown',
      duration: json['movie_duration'].toString() ?? 'Unknown',
      director: json['director'] ?? 'Unknow',
    );
  }
}