
class Results {
    bool adult;
    String backdrop_path;
    List<int> genre_ids;
    int id;
    String original_language;
    String original_title;
    String overview;
    double popularity;
    String poster_path;
    String release_date;
    String title;
    bool video;
    int vote_count;
    String vote_average;

    Results({this.adult, this.backdrop_path, this.genre_ids, this.id, this.original_language, this.original_title, this.overview, this.popularity, this.poster_path, this.release_date, this.title, this.video, this.vote_count,this.vote_average });

    factory Results.fromJson(Map<String, dynamic> json) {
        return Results(
            adult: json['adult'], 
            backdrop_path: json['backdrop_path'], 
            genre_ids: json['genre_ids'] != null ? new List<int>.from(json['genre_ids']) : null, 
            id: json['id'], 
            original_language: json['original_language'], 
            original_title: json['original_title'], 
            overview: json['overview'], 
            popularity: json['popularity'], 
            poster_path: json['poster_path'], 
            release_date: json['release_date'], 
            title: json['title'], 
            video: json['video'], 
            vote_count: json['vote_count'],
            vote_average :json['vote_average '],
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['adult'] = this.adult;
        data['backdrop_path'] = this.backdrop_path;
        data['id'] = this.id;
        data['original_language'] = this.original_language;
        data['original_title'] = this.original_title;
        data['overview'] = this.overview;
        data['popularity'] = this.popularity;
        data['poster_path'] = this.poster_path;
        data['release_date'] = this.release_date;
        data['title'] = this.title;
        data['video'] = this.video;
        data['vote_count'] = this.vote_count;
        data['vote_average'] = this.vote_average;
        if (this.genre_ids != null) {
            data['genre_ids'] = this.genre_ids;
        }
        return data;
    }
}