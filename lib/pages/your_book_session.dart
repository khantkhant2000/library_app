import 'package:flutter/material.dart';
import 'package:library_app/data/vo/home_page_vo/hive_detail_vo/hive_details_vo.dart';
import 'package:provider/provider.dart';

import '../blocs/library_page_bloc.dart';
import '../widgets/books_default_widget.dart';

class YourBooks extends StatelessWidget {
  const YourBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LibraryPageBloc(),
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, top: 20, bottom: 20),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                      width: 2, color: Colors.grey.withOpacity(0.5))),
              child: const Text("Combined Print and E-book Fiction"),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
              child: const Row(
                children: [
                  Icon(Icons.sort),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "Sort by Recent",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Icon(Icons.apps)
                ],
              ),
            ),
            Selector<LibraryPageBloc, List<HiveSaveBooksVO>?>(
              selector: (_, bloc) => bloc.getBookHiveList,
              builder: (_, bookHive, __) {
                return Expanded(
                  child: GridView.builder(
                      itemCount: bookHive?.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 0.7, crossAxisCount: 2),
                      itemBuilder: (_, index) {
                        return BooksDefaultWidget(
                          imageUrl: bookHive?[index].bookImage,
                          booksName: bookHive?[index].title,
                        );
                      }),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
