import 'package:flutter/material.dart';
import 'package:flutter_demo_bloc/blocs/search_bloc.dart';
import 'package:provider/provider.dart';

class SearchBox extends StatefulWidget {
  @override
  _SearchBoxState createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }
  
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    
    var bloc = Provider.of<SearchBloc>(context);
    searchController.addListener(() {
      bloc.search(searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchBloc>(
      builder: (context, bloc, child) => Container(
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
      ),
    );
  }
}
