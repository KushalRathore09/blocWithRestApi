import 'dart:convert';

import 'package:blocwithrestapi/model/movie.dart';
import 'package:blocwithrestapi/utils/string_resources.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;

class MovieApiClient {
  final _baseUrl = "https://api.themoviedb.org/3";
  final http.Client httpClient ;

  MovieApiClient({@required this.httpClient}): assert(MovieApiClient != null);

  Future<Movie>fetchMovie() async{
    final url = '$_baseUrl/movie/now_playing?$API_KEY';
    final response = await this.httpClient.get(url);

    if(response.statusCode != 200){
      throw Exception("Error loading movie list ");
    }
    final json = jsonDecode(response.body);
    return Movie.fromJson(json);
  }
}