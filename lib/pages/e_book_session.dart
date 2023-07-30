import 'package:flutter/material.dart';
import 'package:library_app/blocs/home_page_bloc.dart';
import 'package:provider/provider.dart';
import '../data/vo/home_page_vo/list_vo/lists_vo.dart';
import '../widgets/books_type_name_default_widget.dart';

class EBookSession extends StatelessWidget {
  const EBookSession({super.key});

  @override
  Widget build(BuildContext context) {
    return Selector<HomePageBloc, List<ListsVO>?>(
      selector: (_, bloc) => bloc.getHomeScreenBookList,
      builder: (_, bloc, __) => ListView.builder(
        padding: const EdgeInsets.only(top: 10, bottom: 20),
        itemCount: bloc?.length ?? 0,
        itemBuilder: (context, index) {
          return BooksTypeNameDefaultWidget(
            booksType: bloc?[index].listName ?? '',
            booksList: bloc?[index].books ?? [],
          );
        },
      ),
    );
  }
}
