import 'package:flutter/material.dart';
import 'package:sneakers_search_ssac/model/sneakers.dart';

class CustomGridTile extends StatelessWidget {
  final Sneakers sneaker;

  const CustomGridTile({Key? key, required this.sneaker}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 1 / 1,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(image: NetworkImage(sneaker.thumbnailUrl)),
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(sneaker.name),
        
      ],
    );
  }
}
