import 'package:blocwithrestapi/model/quote.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class QuoteState extends Equatable{
  const QuoteState();

  @override
  List<Object> get props => [];
}
class QuoteEmpty extends QuoteState{}
class QuoteLoading extends QuoteState{}
class QuoteLoaded extends QuoteState{

  final Quote quote ;
  QuoteLoaded({@required this.quote}): assert (quote != null);

  @override
  List<Object>get props => [quote];
}

class QuoteError extends QuoteState{}
