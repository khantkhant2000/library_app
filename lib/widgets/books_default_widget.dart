import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BooksDefaultWidget extends StatelessWidget {
  const BooksDefaultWidget(
      {super.key, required this.imageUrl, required this.booksName});
  final String? imageUrl;
  final String? booksName;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            children: [
              SizedBox(
                height: 190,
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                      placeholder: (context, url) => Image.asset(
                            "images/cover.png",
                            fit: BoxFit.cover,
                          ),
                      imageUrl: imageUrl ?? "",
                      fit: BoxFit.cover),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(child: Text(booksName ?? ""))
        ],
      ),
    );
  }
}
