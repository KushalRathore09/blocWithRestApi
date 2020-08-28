import 'package:blocwithrestapi/bloc/bloc.dart';
import 'package:blocwithrestapi/repository/movie_api_client.dart';
import 'package:blocwithrestapi/repository/movie_repository.dart';
import 'package:blocwithrestapi/screen/movieList.dart';
import 'package:http/http.dart' as http;
import 'package:blocwithrestapi/repository/quote_api_client.dart';
import 'package:blocwithrestapi/repository/quote_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransaction(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

/*void main(){
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final MovieRepository repository = MovieRepository(movieApiClient: MovieApiClient(httpClient: http.Client()));

  runApp(App(movieRepository : repository));
}

class App extends StatelessWidget{
  MovieRepository movieRepository ;

  App({Key key , @required this.movieRepository}) : assert (movieRepository != null) , super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("MovieDB"),
        ),
        body: BlocProvider(
          create: (context) => MovieBloc(movieRepository: movieRepository),
          child: MovieList(),
        ),
      ),
    );
  }
}*/

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  final QuoteRepository repository = QuoteRepository(
      quoteApiClient: QuoteApiClient(
    httpClient: http.Client(),
  ));

  runApp(MyApp(quoteRepository: repository));
}

class MyApp extends StatelessWidget {
  final QuoteRepository quoteRepository;

  MyApp({Key key, @required this.quoteRepository})
      : assert(quoteRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quote App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Quotes"),
        ),
        body: BlocProvider(
          create: (context) => QuoteBloc(quoteRepository: quoteRepository),
          child: MyHomePage(),
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuoteBloc, QuoteState>(builder: (context, state) {
      if (state is QuoteEmpty) {
        BlocProvider.of<QuoteBloc>(context).add(FetchQuote());
      }
      if (state is QuoteError) {
        return Center(
          child: Text(
            'Failed to load quotes',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        );
      }
      if (state is QuoteLoaded) {
        return ListTile(
          leading: Text(
            '${state.quote.id}',
            style: TextStyle(fontSize: 10.0),
          ),
          title: Text(
            '${state.quote.quoteText}',
            style: TextStyle(fontSize: 14.0),
          ),
          isThreeLine: true,
          subtitle: Text(
            '${state.quote.quoteAuthor}',
            style: TextStyle(fontSize: 14.0),
          ),
          dense: true,
        );
      }
      return Center(
        child: CircularProgressIndicator(),
      );
    });
  }
}
