

import 'Result.dart';

class Trailer {
    int id;
    List<TrailerResult> results;

    Trailer({this.id, this.results});

    factory Trailer.fromJson(Map<String, dynamic> json) {
        return Trailer(
            id: json['id'], 
            results: json['results'] != null ? (json['results'] as List).map((i) => TrailerResult.fromJson(i)).toList() : null,
        );
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = new Map<String, dynamic>();
        data['id'] = this.id;
        if (this.results != null) {
            data['results'] = this.results.map((v) => v.toJson()).toList();
        }
        return data;
    }
}