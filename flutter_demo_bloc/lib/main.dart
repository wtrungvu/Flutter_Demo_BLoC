import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/blocs/search_bloc.dart';
import 'views/search_view.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text("Flutter Demo BLoC + Provider"),
          ),
          body: Provider<SearchBloc>.value(
            value: SearchBloc(),
            child: SearchView(),
          ),
        ));
  }
}
