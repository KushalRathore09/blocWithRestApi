import 'package:blocwithrestapi/model/movie.dart';
import 'package:blocwithrestapi/repository/movie_api_client.dart';
import 'package:flutter/cupertino.dart';

class MovieRepository{
  final MovieApiClient movieApiClient ;

  MovieRepository({@required this.movieApiClient}): assert (MovieApiClient != null);

  Future<Movie> fetchMovie() async{
    return await movieApiClient.fetchMovie();
  }


}