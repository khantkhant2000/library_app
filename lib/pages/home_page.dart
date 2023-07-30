import 'package:flutter/material.dart';
import 'package:library_app/blocs/home_page_bloc.dart';
import 'package:library_app/pages/home_view_session.dart';
import 'package:library_app/pages/library_view_session.dart';
import 'package:provider/provider.dart';
import '../view_items/home_page_view_items/home_page_view_items.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> body = const [
    HomeViewSession(),
    LibraryViewSession(),
  ];
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomePageBloc(),
      builder: (context, _) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const SearchPlayBooksItemsView(),
        ),
        bottomNavigationBar: Selector<HomePageBloc, int>(
          selector: (_, bloc) => bloc.selectedIndex,
          builder: (_, selectIndex, __) => BottomNavigationBar(
            currentIndex: selectIndex,
            onTap: (int newIndex) {
              final instance = context.read<HomePageBloc>();
              instance.setIndex(newIndex);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_outlined), label: "Library"),
            ],
          ),
        ),
        body: Selector<HomePageBloc, int>(
          selector: (_, bloc) => bloc.selectedIndex,
          builder: (_, selectedIndex, __) => IndexedStack(
            index: selectedIndex,
            children: body,
          ),
        ),
      ),
    );
  }
}
