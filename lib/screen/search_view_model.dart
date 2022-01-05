import 'package:flutter/material.dart';
import 'package:sneakers_search_ssac/model/sneakers.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchViewModel with ChangeNotifier {
  static final List<String> keywords = [
    "피마원",
    "ROLEX",
    "CHANNEL",
    "Jordan 1",
    "머플러",
    "몽클레르",
    "Dunk",
    "Off-White"
  ];
  static final List<String> categories = [
    "스니커즈",
    "의류",
    "패션잡화",
    "라이프",
    "테크",
  ];
  String _currentKeyword = '';
  String _currentFilter = '';
  List<Sneakers> _sneakers = [];
  bool _isLoading = false;
  bool isFilter = false;

  final TextEditingController _controller = TextEditingController();

  bool get isLoading => _isLoading;

  get currentFilter => _currentFilter;

  TextEditingController get controller => _controller;

  List<Sneakers> get sneakers => _sneakers;

  void getFilter(String filter) {
    if (_currentFilter == filter) {
      _currentFilter = '';
    } else {
      _currentFilter = filter;
    }
    notifyListeners();
  }

  void getSearch(String query) async {
    _isLoading = true;
    notifyListeners();
    await getData(query);
    _isLoading = false;
    notifyListeners();
  }

  void getKeyword(String text) async {
    _currentKeyword = text;
    _controller.text = _currentKeyword;
    _isLoading = true;
    notifyListeners();
    await getData(_currentKeyword);
    _isLoading = false;
    notifyListeners();
  }

  Future getData(String query) async {
    _sneakers = await fetch(query);
  }

  Future<List<Sneakers>> fetch(String query) async {
    String url =
        "https://ssac-sneakes-searcher.herokuapp.com/api/search?q=$query";
    final response = await http.get(Uri.parse(url));
    Iterable jsonResponse =
        convert.jsonDecode(convert.utf8.decode(response.bodyBytes));
    return jsonResponse.map((s) => Sneakers.fromJson(s)).toList();
  }
}
