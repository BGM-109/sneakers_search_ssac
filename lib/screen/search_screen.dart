import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:sneakers_search_ssac/model/sneakers.dart';
import 'package:sneakers_search_ssac/screen/components/custom_grid_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Sneakers> _sneakers = [];
  final _controller = TextEditingController();

  Future<List<Sneakers>> fetch(String query) async {
    String url =
        "https://ssac-sneakes-searcher.herokuapp.com/api/search?q=$query";
    final response = await http.get(Uri.parse(url));
    Iterable jsonResponse = convert.jsonDecode(response.body);
    return jsonResponse.map((s) => Sneakers.fromJson(s)).toList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: TextField(
            maxLines: 1,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.w500),
            cursorColor: Colors.black,
            autofocus: false,
            keyboardType: TextInputType.text,
            controller: _controller,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),),
              fillColor: Colors.grey[200],
              filled: true,
              hintText: "브랜드명, 모델명, 모델번호 등",
              hintStyle: const TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                  fontSize: 12),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: _sneakers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final sneaker = _sneakers[index];
                  return CustomGridTile(
                    sneaker: sneaker,
                  );
                }),
          ),
        )
      ])),
    );
  }
}
