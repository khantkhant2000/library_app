import 'package:flutter/material.dart';
import 'package:library_app/data/vo/home_page_vo/book_vo/books_vo.dart';
import 'package:library_app/data/vo/home_page_vo/hive_detail_vo/hive_details_vo.dart';
import 'package:library_app/data/vo/home_page_vo/list_vo/lists_vo.dart';
import 'package:library_app/data/vo/home_page_vo/result_vo/results_vo.dart';
import 'package:library_app/pages/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'constant/hive_constant.dart';
import 'data/vo/home_page_vo/buy_link_vo/buy_links_vo.dart';

void main() async {
  // BookModel _model = BookModelImpl();
  // _model.getHomeScreenBookList('2023-03-16').then((value) {
  //   print("the value is ==========> $value");
  // }).catchError((onerror) {
  //   print("Error==========>$onerror");
  // });

  await Hive.initFlutter();

  Hive.registerAdapter(ListsVOAdapter());
  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(HiveSaveBooksVOAdapter());
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(ResultsVOAdapter());

  await Hive.openBox<ListsVO>(kBoxNameForBook);
  await Hive.openBox<HiveSaveBooksVO>(kBoxNameForSaveBooks);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const HomePage());
}
