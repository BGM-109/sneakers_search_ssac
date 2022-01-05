import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'package:sneakers_search_ssac/model/keywords.dart';
import 'package:sneakers_search_ssac/screen/search_view_model.dart';

class CategoryButton extends StatefulWidget {
  final String text;

  const CategoryButton({Key? key, required this.text}) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool _isPressed = false;
  List<Map<Category, String>> converter = [
    {Category.sneakers: "스니커즈"},
    {Category.clothes: "의류"},
    {Category.acc: "패션잡화"},
    {Category.life: "라이프"},
    {Category.tech: "테크"},
  ];

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SearchViewModel>();
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: viewModel.currentFilter == widget.text ? Colors.red[50] : Colors.grey[200],
              elevation: 0),
          onPressed: () {
            viewModel.getFilter(widget.text);
          },
          child: Text(
            widget.text,
            style: TextStyle(
                color: viewModel.currentFilter == widget.text ? Colors.red[300] : Colors.black,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
