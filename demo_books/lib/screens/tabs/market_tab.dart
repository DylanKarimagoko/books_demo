import 'package:demo_books/data/data.dart';
import 'package:demo_books/screens/book_info.dart';
import 'package:demo_books/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:page_transition/page_transition.dart';

class MarketTab extends StatefulWidget {
  const MarketTab({super.key});

  @override
  State<MarketTab> createState() => _MarketTabState();
}

class _MarketTabState extends State<MarketTab> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 55,
          child: ListView.builder(
              itemCount: Data.tabs.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    child: selections(
                      index,
                      Data.tabs[index]['icon'],
                      Data.tabs[index]['title'],
                    ),
                  )),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridView.builder(
              itemCount: 6,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.41,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2),
              itemBuilder: (context, index) =>
                  MarketWidget(book: Data.marketBooks[index], index: index)
                      .animate(delay: 0.ms)
                      .fadeIn(delay: (Styles.fadeDuration * index).ms)
                      .slideY(delay: (Styles.duration * index).ms, begin: .1)),
        ))
      ],
    ));
  }

  Widget selections(int index, String icon, title) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        alignment: Alignment.center,
        width: 145,
        decoration: BoxDecoration(
            color: _selectedIndex == index
                ? Styles.secondaryBrown
                : Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
                color: _selectedIndex == index
                    ? Styles.primaryGold
                    : Styles.secondaryGrey,
                width: _selectedIndex == index ? 1.2 : .5)),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset("assets/images/$icon")),
              const SizedBox(
                width: 3,
              ),
              Text(title)
            ]),
      )
          .animate(onPlay: (controller) => controller.duration = 1000.ms)
          .slideX(begin: 0.5, delay: (Styles.duration * index).ms)
          .fadeIn(delay: (Styles.fadeDuration * index).ms),
    );
  }
}

class MarketWidget extends StatelessWidget {
  const MarketWidget({super.key, required this.book, required this.index});

  final Map book;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
              type: PageTransitionType.fade,
              duration: 1000.ms,
              reverseDuration: 1000.ms,
              child: BookInfo(
                tag: "${book['title']}$index",
                book: book,
              )),
        );
      },
      child: Container(
        decoration: BoxDecoration(
            color: Styles.secondaryBrown,
            borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: Hero(
                tag: "${book['title']}$index",
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    "assets/images/${book['coverPhoto']}",
                    fit: BoxFit.cover,
                  ),
                ),
              )),
              SizedBox(
                height: 85,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          book["title"],
                          style: const TextStyle(
                              fontSize: Styles.marketbookTitle,
                              color: Styles.primaryBlack,
                              fontFamily: Styles.dmSerifRegular),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          book["author"],
                          style: const TextStyle(
                              color: Styles.secondaryGrey,
                              fontSize: Styles.bookAuthor),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          book["price"],
                          style: const TextStyle(
                              fontFamily: Styles.dmSerifRegular,
                              fontSize: Styles.price),
                        ),
                        SizedBox(
                            height: 30,
                            width: 80,
                            child: TextButton(
                                style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)),
                                    backgroundColor: Styles.primaryBlack,
                                    foregroundColor: Styles.secondaryWhite),
                                onPressed: () {},
                                child: const Text(
                                  "Buy",
                                  style: TextStyle(
                                      fontSize: Styles.bookRatings,
                                      fontWeight: FontWeight.w600),
                                )))
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
