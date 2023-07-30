import 'package:flutter/material.dart';
import 'package:library_app/blocs/home_page_bloc.dart';
import 'package:provider/provider.dart';
import '../data/vo/home_page_vo/book_vo/books_vo.dart';
import 'books_default_widget.dart';

class BooksTypeNameDefaultWidget extends StatelessWidget {
  const BooksTypeNameDefaultWidget(
      {super.key, required this.booksType, required this.booksList});
  final String? booksType;

  final List<BooksVO> booksList;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(booksType ?? ''),
                const Icon(Icons.chevron_right)
              ],
            ),
          ),
          Consumer<HomePageBloc>(
            builder: (_, bloc, __) {
              return SizedBox(
                height: 230,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, index) => Padding(
                      padding: const EdgeInsets.only(
                        right: 20,
                        top: 15,
                      ),
                      child: Stack(
                        children: [
                          BooksDefaultWidget(
                            imageUrl: booksList[index].bookImage,
                            booksName: booksList[index].title,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5, top: 5),
                            child: Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    bloc.isExist = !bloc.isExist;
                                    bloc.saveAndDeleteBookHive(
                                        booksList[index]);
                                    print(
                                        "this is save in hive ====>${booksList[index].title} ");
                                  },
                                  icon: bloc.isExist
                                      ? const Icon(
                                          Icons.favorite,
                                          color: Colors.red,
                                        )
                                      : const Icon(Icons.favorite_border),
                                ),
                                const SizedBox(
                                  width: 40,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    Icons.more_horiz,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
