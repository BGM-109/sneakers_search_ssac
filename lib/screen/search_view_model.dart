import 'package:flutter/material.dart';
import 'package:sneakers_search_ssac/model/sneakers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchViewModel with ChangeNotifier {
  String _currentKeyword = '';
  List<Sneakers> _sneakers = [];

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  TextEditingController get controller => _controller;
  FocusNode get focusNode => _focusNode;

  List<Sneakers> get sneakers => _sneakers;

  void getKeyword(String text) {
    _currentKeyword = text;
    _controller.text = _currentKeyword;
    getData(_currentKeyword);
    notifyListeners();
  }

  void getData(String query) async {
    _sneakers = await fetch(query);
  }

  Future<List<Sneakers>> fetch(String query) async {
    String url =
        "https://ssac-sneakes-searcher.herokuapp.com/api/search?q=$query";
    final response = await http.get(Uri.parse(url));
    Iterable jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse.map((s) => Sneakers.fromJson(s)).toList();
  }
}
