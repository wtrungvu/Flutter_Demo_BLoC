import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/blocs/search_bloc.dart';

import 'module.search/search_box.dart';
import 'module.search/search_result.dart';

class SearchView extends StatelessWidget {
  final SearchBloc searchBloc = SearchBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.all(15.0),
          child: Column(
            children: <Widget>[
              SearchBox(
                bloc: searchBloc,
              ),
              Expanded(
                child: Result(
                  bloc: searchBloc,
                ),
              ),
            ],
          )),
    );
  }
}
