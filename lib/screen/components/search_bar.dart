import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.focusNode,
    required this.controller,
  }) : super(key: key);

  final FocusNode focusNode;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              focusNode: focusNode,
              maxLines: 1,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.w500),
              cursorColor: Colors.black,
              autofocus: false,
              keyboardType: TextInputType.text,
              controller: controller,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(12),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
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
          InkWell(
            onTap: () {
              focusNode.unfocus();
            },
            child: Visibility(
              visible: focusNode.hasFocus,
              child: const Padding(
                padding: EdgeInsets.only(left: 12.0),
                child: Center(child: Text("취소")),
              ),
            ),
          )
        ],
      ),
    );
  }
}
