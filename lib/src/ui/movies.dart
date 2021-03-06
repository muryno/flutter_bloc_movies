


import 'package:chopper/chopper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterblocmovies/src/bloc/movies_bloc.dart';
import 'package:flutterblocmovies/src/bloc/movies_details_inherited_widget_provider.dart';
import 'package:flutterblocmovies/src/model/movies.dart';
import 'package:flutterblocmovies/src/utils/url_constant.dart';

import 'movie_detail.dart';

class Movie extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MovieListState();
  }
}

  class MovieListState extends State<Movie> {
    @override
    void initState() {
      super.initState();
      bloc.fetchAllMovies();
    }

    @override
    void dispose() {
      bloc.dispose();
      super.dispose();
    }


  @override
  Widget build(BuildContext context) {



    return Scaffold(
      appBar: AppBar(
        title: Text("movies"),
      ),
      body: StreamBuilder(
        stream: bloc.allMovies,
        builder: (context,  AsyncSnapshot< Response<Movies>>  snapshot){
          if(snapshot.hasData){
            return buildList(snapshot.data.body);
          }else if(snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator());
        },
      ),


    );


  }


  Widget buildList(Movies snapshot) {
    return Hero(
      tag: 'dhddj',
      child: Padding(
        padding: EdgeInsets.only(left: 4,right: 4,top: 4,),
        child:  GridView.builder(
            itemCount: snapshot.results.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              return GridTile(
                child: InkResponse(
                  enableFeedback: true,
                  child:  Image.network(
                    'https://image.tmdb.org/t/p/w185${snapshot
                        .results[index].poster_path}',
                    fit: BoxFit.cover,
                  ),


                  onTap: () => openDetailPage(snapshot, index),
                ),
              );
            }),
      ),
    );
  }



    openDetailPage(Movies data, int index) {

      final page = MovieDetailBlocProvider(
        child:  MovieDetail(
          title: data.results[index].title,
          posterUrl: data.results[index].backdrop_path,
          description: data.results[index].overview,
          releaseDate: data.results[index].release_date,
          voteAverage: data.results[index].vote_average.toString(),
          movieId: data.results[index].id,
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) {
          return page;
        }),
      );
    }


  }

