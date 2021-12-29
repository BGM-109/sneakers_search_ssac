import 'package:flutter/material.dart';

class CategoryButton extends StatefulWidget {
  final String text;

  const CategoryButton({Key? key, required this.text}) : super(key: key);

  @override
  State<CategoryButton> createState() => _CategoryButtonState();
}

class _CategoryButtonState extends State<CategoryButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 8.0),
      child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: _isPressed ? Colors.red[50]: Colors.grey[200], elevation: 0),
          onPressed: () {
            setState(() {
              _isPressed = !_isPressed;
            });
          },
          child: Text(
            widget.text,
            style: TextStyle(
                color: _isPressed ? Colors.red[300] : Colors.black,
                fontWeight: FontWeight.bold),
          )),
    );
  }
}
