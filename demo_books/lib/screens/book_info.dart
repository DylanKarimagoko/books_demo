import 'package:demo_books/data/data.dart';
import 'package:demo_books/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BookInfo extends StatefulWidget {
  const BookInfo({super.key, required this.tag, required this.book});
  final String tag;
  final Map book;

  @override
  State<BookInfo> createState() => _BookInfoState();
}

class _BookInfoState extends State<BookInfo> with TickerProviderStateMixin {
  int _index = 0;
  late AnimationController _animationController;
  late Animation _animation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(vsync: this, duration: 750.ms);

    _animation = Tween<double>(begin: 1, end: 0).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          Styles.bookInfo,
          style: TextStyle(
              fontFamily: Styles.dmSerifRegular,
              fontSize: Styles.recomendedTitle),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: SizedBox(
                  width: 28,
                  height: 28,
                  child:
                      Image.asset("assets/images${Styles.bookmarkOutlined}")))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Expanded(
              child: SizedBox(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Hero(
                    tag: widget.tag,
                    child: SizedBox(
                      height: size.height * .33,
                      width: size.width,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          "assets/images/${widget.book['coverPhoto']}",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.book["title"],
                                style: const TextStyle(
                                    fontSize: Styles.bookInfoTitle,
                                    fontFamily: Styles.dmSerifRegular),
                              )
                                  .animate()
                                  .fadeIn(duration: 250.ms, delay: 500.ms)
                                  .slideY(begin: 1, duration: 900.ms),
                              Text(
                                "by ${widget.book["author"]}",
                                style: const TextStyle(
                                    fontSize: Styles.bookAuthor,
                                    color: Styles.secondaryGrey),
                              )
                                  .animate()
                                  .fadeIn(duration: 250.ms, delay: 800.ms)
                                  .slideY(begin: 1, duration: 900.ms),
                            ],
                          ),
                          Text(
                            widget.book['price'],
                            style: const TextStyle(
                                fontFamily: Styles.dmSerifRegular,
                                fontSize: Styles.booksTitle),
                          )
                              .animate()
                              .fadeIn(duration: 250.ms, delay: 890.ms)
                              .slideY(begin: 1, duration: 900.ms),
                        ]),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        details("Released", "2021", 1790),
                        details("Part", "16", 2040),
                        details("Pages", "340", 2290),
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            tabs("Synopsis", 0)
                                .animate(onComplete: (controller) {
                                  _animationController.forward();
                                })
                                .fadeIn(delay: 2540.ms)
                                .slideY(),
                            tabs("Details", 1)
                                .animate()
                                .fadeIn(delay: 2790.ms)
                                .slideY(),
                            tabs("Author", 2)
                                .animate()
                                .fadeIn(delay: 3040.ms)
                                .slideY(),
                            tabs("Review", 3)
                                .animate()
                                .fadeIn(delay: 3290.ms)
                                .slideY(),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          const Divider(
                            color: Styles.secondaryGrey,
                            thickness: .5,
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.center,
                              child: SizedBox(
                                  height: 2,
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 4,
                                      itemBuilder: (context, index) =>
                                          Container(
                                            width: size.width * .25,
                                            color: _index == index
                                                ? Styles.primaryBlack
                                                : Colors.transparent,
                                          ))),
                            ),
                          ),
                          Positioned.fill(
                              child: Align(
                            alignment: Alignment.center,
                            child: AnimatedBuilder(
                              animation: _animation,
                              builder: (BuildContext context, _) {
                                return Align(
                                  alignment: Alignment.centerRight,
                                  child: AnimatedContainer(
                                    width: size.width * _animation.value,
                                    height: 5,
                                    color: Styles.secondaryWhite,
                                    duration: 750.ms,
                                  ),
                                );
                              },
                            ),
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: const Text(Data.dummyText)
                        .animate()
                        .fadeIn(delay: 4040.ms, duration: 1000.ms)
                        .slideY(duration: 1000.ms, begin: 1),
                  ),
                )
              ],
            ),
          )),
          SizedBox(
            height: 60,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  button(
                      label: "Start Reading",
                      onPressed: () {
                        //print("Reading");
                      },
                      icon: Icon(MdiIcons.bookOpenOutline),
                      foreground: Styles.primaryBlack,
                      background: Styles.primaryGold,
                      width: size.width * .45,
                      delay: 5240.ms),
                  button(
                      label: "Play Audio",
                      onPressed: () {
                        //print("Playing audio");
                      },
                      icon: const Icon(Icons.play_circle_outlined),
                      foreground: Styles.secondaryWhite,
                      background: Styles.primaryBlack,
                      width: size.width * .47,
                      delay: 5040.ms),
                ]),
          )
        ]),
      ),
    );
  }

  GestureDetector tabs(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _index = index;
        });
      },
      child: Text(
        title,
        style: TextStyle(
            fontSize: Styles.infoTabs,
            color: _index == index ? Styles.primaryBlack : Styles.secondaryGrey,
            fontWeight: _index == index ? FontWeight.bold : FontWeight.normal),
      ),
    );
  }

  Widget details(String title, subTitle, double delay) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .3,
      height: size.height * .095,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Styles.primaryGold, width: 1)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(color: Styles.secondaryGrey),
          ),
          Text(
            subTitle,
            style: const TextStyle(
                color: Styles.primaryBlack, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    ).animate().fadeIn(delay: delay.ms).slideX(begin: .4);
  }

  Widget button(
      {required String label,
      required VoidCallback onPressed,
      required Icon icon,
      required Color foreground,
      background,
      required double width,
      delay}) {
    return SizedBox(
      height: 55,
      width: width,
      child: TextButton.icon(
          style: TextButton.styleFrom(
              foregroundColor: foreground,
              backgroundColor: background,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5))),
          onPressed: onPressed,
          icon: icon,
          label: Text(label)),
    ).animate().slideY(delay: delay, begin: 1.5, duration: 700.ms);
  }
}
