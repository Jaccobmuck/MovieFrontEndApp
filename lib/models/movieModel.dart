class MovieModel{
  final int movieId;
  final String title;
  final String description;
  final String postedUrl;
  final String genre;

  MovieModel({
    required this.movieId,
    required this.title,
    required this.description,
    required this.postedUrl,
    required this.genre
  });

  factory MovieModel.fromJson(Map<String, dynamic> json){
    return MovieModel(
        movieId: json['movieId'],
        title: json['title'] ?? 'untitled',
        description: json['description'] ?? 'No description',
        postedUrl: json['postedUrl'] ?? 'No movie poster available',
        genre: json['genre'] ?? 'Unknown'
    );
  }

  Map<String, dynamic> toJson(){
    return{
      'movieId': movieId,
      'title': title,
      'description': description,
      'postedUrl': postedUrl,
      'genre': genre
    };
  }
}