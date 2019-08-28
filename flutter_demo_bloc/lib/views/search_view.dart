import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/blocs/search_bloc.dart';

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

class SearchBox extends StatefulWidget {
  final SearchBloc bloc;
  SearchBox({SearchBloc bloc}) : this.bloc = bloc;

  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      widget.bloc.search(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: searchController,
        decoration: InputDecoration(
            hintText: "Search...",
            prefixIcon: Icon(Icons.search),
            suffixIcon: IconButton(
              icon: Icon(Icons.clear),
              onPressed: () => searchController.clear(),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            )),
      ),
    );
  }
}

class Result extends StatefulWidget {
  final SearchBloc bloc;
  Result({SearchBloc bloc}) : this.bloc = bloc;

  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20.0),
      child: StreamBuilder<List<String>>(
        initialData: [],
        stream: widget.bloc.searchController.stream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.length,
            itemBuilder: (context, index) {
              return _buildItemRow(snapshot.data[index]);
            },
          );
        },
      ),
    );
  }

  Widget _buildItemRow(String data) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Text(
        data,
        style: TextStyle(fontSize: 25.0),
      ),
    );
  }
}
