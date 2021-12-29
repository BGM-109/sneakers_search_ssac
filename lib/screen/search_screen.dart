import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sneakers_search_ssac/screen/components/category_button.dart';
import 'package:sneakers_search_ssac/screen/components/custom_grid_tile.dart';
import 'package:sneakers_search_ssac/screen/components/keyword_button.dart';
import 'package:sneakers_search_ssac/screen/components/search_bar.dart';
import 'package:sneakers_search_ssac/screen/search_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final List<String> _keywords = [
    "피마원",
    "ROLEX",
    "CHANNEL",
    "Jordan 1",
    "머플러",
    "몽클레르",
    "Dunk",
    "Off-White"
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        SearchBar(
          focusNode: viewModel.focusNode,
          controller: viewModel.controller,
        ),
        Container(
          height: 100,
          color: Colors.black,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: const [
              CategoryButton(text: "럭셔리"),
              VerticalDivider(
                width: 20,
                thickness: 2,
                indent: 20,
                endIndent: 0,
                color: Colors.black,
              ),
              CategoryButton(text: "스니커즈"),
              CategoryButton(text: "의류"),
              CategoryButton(text: "패션 잡화"),
              CategoryButton(text: "라이프"),
              CategoryButton(text: "테크"),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _keywords
                .map<Widget>((text) => KeywordButton(
                      text: text,
                    ))
                .toList(),
          ),
        ),
        const Divider(
          thickness: 0,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
                itemCount: viewModel.sneakers.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemBuilder: (context, index) {
                  final sneaker = viewModel.sneakers[index];
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
