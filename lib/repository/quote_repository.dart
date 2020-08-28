import 'package:blocwithrestapi/model/quote.dart';
import 'package:blocwithrestapi/repository/quote_api_client.dart';
import 'package:flutter/cupertino.dart';

class QuoteRepository {
  final QuoteApiClient quoteApiClient ;

  QuoteRepository({@required this.quoteApiClient}) : assert(quoteApiClient != null);

  Future<Quote> fetchQuote() async{
    return await quoteApiClient.fetchQuote();
  }
}