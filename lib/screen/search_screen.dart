import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sneakers_search_ssac/screen/components/category_button.dart';
import 'package:sneakers_search_ssac/screen/components/category_button_icon.dart';
import 'package:sneakers_search_ssac/screen/components/custom_grid_tile.dart';
import 'package:sneakers_search_ssac/screen/components/keyword_button.dart';
import 'package:sneakers_search_ssac/screen/components/my_banner.dart';
import 'package:sneakers_search_ssac/screen/components/search_bar.dart';
import 'package:sneakers_search_ssac/screen/search_view_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.removeListener(() {});
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return SafeArea(
      child: Scaffold(
          body: Column(children: [
        SearchBar(
          focusNode: _focusNode,
          controller: viewModel.controller,
        ),
        MyBanner(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              const CategoryButtonIcon(),
              const CategoryButton(text: "럭셔리"),
              const VerticalDivider(
                width: 20,
                thickness: 0,
              ),
              ...SearchViewModel.categories
                  .map((text) => CategoryButton(text: text))
                  .toList(),
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: SearchViewModel.keywords
                .map<Widget>((text) => KeywordButton(
                      text: text,
                    ))
                .toList(),
          ),
        ),
        const Divider(
          thickness: 0,
        ),
        viewModel.isLoading
            ? const Expanded(child: Center(child: CircularProgressIndicator()))
            : Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                      itemCount: viewModel.sneakers.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1 / 1.6,
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
