import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

///Search Play Books Session
class SearchPlayBooksItemsView extends StatelessWidget {
  const SearchPlayBooksItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Colors.black38,
        ),
      ),
      child: ListTile(
        onTap: () {
          // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SearchPage(),));
        },
        leading: const Icon(Icons.search),
        title: const Text(
          'Search Play Books',
          style: TextStyle(color: Colors.grey),
        ),
        trailing: const Icon(Icons.person),
      ),
    );
  }
}

///visible or invisible carousel slider Session
class CarouselSliderItemsView extends StatelessWidget {
  const CarouselSliderItemsView({super.key, required this.list});
  final List<Widget> list;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: false,
      child: CarouselSlider(
          items: list,
          options: CarouselOptions(
            height: 400,
            aspectRatio: 16 / 9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            scrollDirection: Axis.horizontal,
          )),
    );
  }
}
