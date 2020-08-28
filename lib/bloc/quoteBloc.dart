import 'package:blocwithrestapi/bloc/quoteEvent.dart';
import 'package:blocwithrestapi/bloc/quoteState.dart';
import 'package:blocwithrestapi/model/quote.dart';
import 'package:blocwithrestapi/repository/quote_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState>{
  QuoteRepository quoteRepository ;

  QuoteBloc({@required this.quoteRepository}): assert(quoteRepository != null);


  @override
  QuoteState get initialState => QuoteEmpty();

  @override
  Stream<QuoteState> mapEventToState(QuoteEvent event) async*{
    if(event is FetchQuote){
      yield QuoteLoading();
      try{
        final Quote quote = await quoteRepository.fetchQuote() ;
        yield QuoteLoaded(quote: quote);
      }catch(_){
        yield QuoteError();
      }
    }
  }

}