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
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                    onPressed: () async {
                      final sneakers = await fetch(_controller.text);
                      setState(() {
                        _sneakers = sneakers;
                      });
                      print(sneakers);
                    },
                    icon: const Icon(Icons.search))),
          ),
          Expanded(
            child: GridView.builder(
                itemCount: _sneakers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemBuilder: (context, index) {
                  final sneaker = _sneakers[index];
                  return CustomGridTile(
                    sneaker: sneaker,
                  );
                }),
          )
        ]));
  }
}
