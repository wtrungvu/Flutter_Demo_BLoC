import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/blocs/search_bloc.dart';
import 'package:provider/provider.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder: (context, bloc, child) => Container(
        margin: const EdgeInsets.only(top: 20.0),
        child: StreamBuilder<List<String>>(
          initialData: [],
          stream: bloc.searchController.stream,
          builder: (context, snapshot) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return _buildItemRow(snapshot.data[index]);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemRow(String data) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: Text(
        data,
        style: TextStyle(fontSize: 25.0),
      ),
    );
  }
}
