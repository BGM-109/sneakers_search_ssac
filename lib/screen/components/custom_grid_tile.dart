import 'package:flutter/material.dart';
import 'package:sneakers_search_ssac/model/sneakers.dart';

class CustomGridTile extends StatelessWidget {
  final Sneakers sneaker;

  const CustomGridTile({Key? key, required this.sneaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        color: Colors.grey[200],
        image: DecorationImage(
            fit: BoxFit.cover, image: NetworkImage(sneaker.thumbnailUrl)),
      ),
    );
  }
}
