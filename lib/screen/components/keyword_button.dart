import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sneakers_search_ssac/screen/search_view_model.dart';

class KeywordButton extends StatelessWidget {
  final String text;

  const KeywordButton({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<SearchViewModel>();
    return InkWell(
      onTap: () {
        viewModel.getKeyword(text);
      },
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [Center(child: Text(text))],
        ),
      ),
    );
  }
}
