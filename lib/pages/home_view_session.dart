import 'package:flutter/material.dart';
import 'package:library_app/pages/e_book_session.dart';
import 'audio_book_session.dart';

class HomeViewSession extends StatelessWidget {
  const HomeViewSession({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: SizedBox(
                width: double.infinity,
                height: 50,
                child: TabBar(
                  dividerColor: Colors.transparent,
                  labelPadding:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
                  labelColor: Colors.black,
                  indicatorColor: Colors.blue[900],
                  unselectedLabelColor: Colors.grey,
                  indicatorSize: TabBarIndicatorSize.label,
                  indicatorWeight: 2,
                  tabs: const [
                    Tab(
                      text: "EBook",
                    ),
                    Tab(
                      text: "AudioBook",
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              child: TabBarView(
                children: [EBookSession(), AudionBookSession()],
              ),
            )
          ],
        ),
      ),
    );
  }
}
