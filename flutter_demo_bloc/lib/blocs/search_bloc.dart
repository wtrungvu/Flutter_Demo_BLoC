import 'dart:async';
import 'dart:core';

class SearchBloc {
  var data = [
    "HTML",
    "CSS",
    "JavaScript",
    "JQuery",
    "Angular",
    "Java",
    "C#",
    "ASP.NET",
    "Android",
    "Objective C",
    "C",
    "C++",
    "Swift",
    "Dart",
    "Golang",
    "Python",
    "Assembly",
    "Flutter",
    "React Natve",
    "Angular",
    "Xamarin",
  ];

  StreamController<List<String>> searchController =
      StreamController<List<String>>();

  search(String query) {
    print(query);
    if (query.isEmpty) {
      searchController.sink.add(data);
      return;
    }

    _filter(query).then((result) {
      searchController.sink.add(result);
    });
  }

  Future<List<String>> _filter(query) {
    var completer = Completer<List<String>>();
    List<String> result = [];

    data.forEach((value) {
      if (value.contains(query)) {
        result.add(value);
      }
    });

    completer.complete(result);
    return completer.future;
  }

  dispose() {
    searchController.close();
  }
}
