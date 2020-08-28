import 'package:blocwithrestapi/bloc/movieEvent.dart';
import 'package:blocwithrestapi/bloc/movieState.dart';
import 'package:blocwithrestapi/model/movie.dart';
import 'package:blocwithrestapi/repository/movie_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBloc extends Bloc<MovieEvent , MovieState>{

  MovieRepository movieRepository ;

  MovieBloc({@required this.movieRepository}): assert (movieRepository != null);

  @override
  MovieState get initialState => MovieEmpty();

  @override
  Stream<MovieState> mapEventToState(MovieEvent event) async*{
    if(event is FetchMovie){
      yield MovieLoading();
      try{
        final Movie movie = await movieRepository.fetchMovie() ;
        yield MovieLoaded(movie: movie);
      }catch(_){
        yield MovieError();
      }
    }
  }

}