class Results {
  bool adult;
  String _backdropPath;
  List<int> genreIds;
  int id;
  String originalLanguage;
  String originalTitle;
  String overview;
  double popularity;
  String _posterPath;
  String releaseDate;
  String title;
  bool video;
  num voteAverage;
  num voteCount;

  Results(
      {this.adult,
        this.genreIds,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  Results.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    _backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    _posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['genre_ids'] = this.genreIds;
    data['id'] = this.id;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['overview'] = this.overview;
    data['popularity'] = this.popularity;
    data['poster_path'] = this.posterPath;
    data['release_date'] = this.releaseDate;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    return data;
  }

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.originalTitle;
    data['imageURL'] = this.posterPath;
    data['vote'] = this.voteCount;
    data['popularity'] = this.popularity;
    data['release'] = this.releaseDate;
    data['overView'] = this.overview;
    return data;
  }


  Results.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    originalTitle = json['title'];
    overview = json['overView'];
    popularity = json['popularity'];
    _posterPath = json['imageURL'];
    releaseDate = json['release'];
    voteCount = json['vote'];
  }

   String get posterPath => "https://image.tmdb.org/t/p/w200"+this._posterPath;
  String get backdropPath => "https://image.tmdb.org/t/p/w200"+this._backdropPath;
}