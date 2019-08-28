import 'package:flutter/material.dart';
import 'module.search/search_box.dart';
import 'module.search/search_result.dart';

class SearchView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            SearchBox(),
            Expanded(
              child: Result(),
            ),
          ],
        ));
  }
}
