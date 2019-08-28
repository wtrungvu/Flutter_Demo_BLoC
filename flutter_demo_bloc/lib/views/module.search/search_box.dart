import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/blocs/search_bloc.dart';

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
