import 'dart:convert';

import 'package:blocwithrestapi/model/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class QuoteApiClient {
  final _baseUrl = 'https://quote-garden.herokuapp.com';
  final http.Client httpClient;

  QuoteApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  Future<Quote>fetchQuote() async{
    final url = '$_baseUrl/quotes/random';
    final response = await this.httpClient.get(url);

    if(response.statusCode != 200){
      throw new Exception('error getting quotes');
    }

    final json = jsonDecode(response.body);
    return Quote.fromJson(json);
  }

}
