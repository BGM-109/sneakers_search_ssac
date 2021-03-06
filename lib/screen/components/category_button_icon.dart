import 'package:flutter/material.dart';

class CategoryButtonIcon extends StatefulWidget {
  const CategoryButtonIcon({
    Key? key,
  }) : super(key: key);

  @override
  State<CategoryButtonIcon> createState() => _CategoryButtonIconState();
}

class _CategoryButtonIconState extends State<CategoryButtonIcon> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.all(0),
              primary: _isPressed ? Colors.red[50] : Colors.grey[200],
              elevation: 0),
          onPressed: () {
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          child: Icon(
            Icons.sort,
            color: _isPressed ? Colors.red[300] : Colors.black,
          )),
    );
  }
}
