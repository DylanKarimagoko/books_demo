import 'package:demo_books/data/data.dart';
import 'package:demo_books/utils/styles.dart';
import 'package:demo_books/widgets/book_widget.dart';
import 'package:demo_books/widgets/recommended.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(child: RecommendedWidget()),
        SliverToBoxAdapter(
          child: Padding(
            padding:
                EdgeInsets.only(top: 20, bottom: 20, left: size.width * .025),
            child: const Text(
              Styles.headingHome,
              style: TextStyle(
                  fontFamily: Styles.dmSerifRegular,
                  fontSize: Styles.booksTitle),
            ),
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          ...Data.popularBooks.asMap().entries.map((book) =>
              BookWidget(data: book.value)
                  .animate()
                  .slideY(
                      begin: 1.5,
                      delay: (Styles.duration * (book.key + 1)).ms,
                      duration: 1000.ms)
                  .fadeIn(
                      duration: 1000.ms,
                      delay: (Styles.fadeDuration * (book.key + 1)).ms))
        ])),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 10,
          ),
        )
      ],
    ));
  }

  @override
  bool get wantKeepAlive => true;
}
