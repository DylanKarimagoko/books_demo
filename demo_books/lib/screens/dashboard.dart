import 'package:demo_books/screens/tabs/bookmark_tab.dart';
import 'package:demo_books/screens/tabs/home_tab.dart';
import 'package:demo_books/screens/tabs/market_tab.dart';
import 'package:demo_books/screens/tabs/user_tab.dart';
import 'package:demo_books/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  int _useIndex = 0;
  late AnimationController _animationController;
  late Animation _animation;
  int _notifications = 0;

  final List<Widget> _list = const <Widget>[
    HomeTab(),
    MarketTab(),
    BookMarkTab(),
    UserTab()
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: 1000.ms); //1000 adjust to suit your needs

    _animation = Tween<double>(begin: 0, end: 13).animate(_animationController)
      ..addListener(_listening);
  }

  void _listening() {
    if (_animation.isCompleted) {
      setState(() {
        _useIndex = _selectedIndex;
      });
      _animationController.reset();
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  List appTitles = <Widget>[
    UnconstrainedBox(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: SizedBox(
            height: 50,
            child: Image.asset(
              "assets/images/${Styles.logo}",
              fit: BoxFit.cover,
            )),
      ),
    ),
    const Center(
      child: Text(
        Styles.exploreMarket,
        style: TextStyle(
            fontFamily: Styles.dmSerifRegular,
            fontSize: Styles.recomendedTitle),
      ),
    ),
    const Center(
      child: Text(Styles.exploreCollection,
          style: TextStyle(
              fontFamily: Styles.dmSerifRegular,
              fontSize: Styles.recomendedTitle)),
    ),
    const Center(
      child: Text(Styles.account,
          style: TextStyle(
              fontFamily: Styles.dmSerifRegular,
              fontSize: Styles.recomendedTitle)),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        leadingWidth: 160,
        leading: appTitles[_useIndex],
        actions: [
          Tooltip(
            message: "Notifications",
            child: Badge.count(
              isLabelVisible: _notifications != 0,
              offset: const Offset(-4, 5),
              count: _notifications,
              child: IconButton(
                  onPressed: () {
                    setState(() {
                      _notifications++;
                    });
                  },
                  icon: SizedBox(
                      width: 24,
                      height: 24,
                      child: Image.asset("assets/images/${Styles.bell}"))),
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: SizedBox(
                  width: 28,
                  height: 28,
                  child: Image.asset("assets/images/${Styles.search}"))),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Stack(
        children: [
          _list[_useIndex], // current selected

          Positioned.fill(
            bottom: 0,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Container(
                        decoration: const BoxDecoration(
                            color: Styles.secondaryWhite,
                            shape: BoxShape.circle),
                        width: size.width * .4,
                        height: size.width * .4,
                      ),
                    );
                  }),
            ),
          ), //old selected
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
          elevation: 12,
          type: BottomNavigationBarType.fixed,
          currentIndex: _selectedIndex,
          onTap: (index) {
            if (!_animationController.isAnimating && _selectedIndex != index) {
              _animationController.forward();
              setState(() {
                _selectedIndex = index;
              });
            }
          },
          items: [
            BottomNavigationBarItem(
                label: "",
                icon: SizedBox(
                    height: 25,
                    width: 25,
                    child: Image.asset("assets/images${Styles.homeOutlined}")),
                activeIcon: SizedBox(
                  height: 40,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset("assets/images${Styles.homeFilled}"),
                      ),
                      Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              color: Styles.primaryGold,
                              shape: BoxShape.circle))
                    ],
                  ),
                )),
            BottomNavigationBarItem(
                label: "",
                activeIcon: SizedBox(
                  height: 40,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 30,
                          width: 40,
                          child: Image.asset(
                            "assets/images${Styles.marketFilled}",
                            width: 40,
                            fit: BoxFit.fitWidth,
                          )),
                      Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              color: Styles.primaryGold,
                              shape: BoxShape.circle))
                    ],
                  ),
                ),
                icon: SizedBox(
                    height: 38,
                    width: 38,
                    child: Image.asset(
                      "assets/images${Styles.marketOutlined}",
                      fit: BoxFit.cover,
                    ))),
            BottomNavigationBarItem(
                label: "",
                activeIcon: SizedBox(
                  height: 40,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child: Image.asset(
                              "assets/images${Styles.bookmarkFilled}")),
                      Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              color: Styles.primaryGold,
                              shape: BoxShape.circle))
                    ],
                  ),
                ),
                icon: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset(
                        "assets/images${Styles.bookmarkOutlined}"))),
            BottomNavigationBarItem(
                label: "",
                activeIcon: SizedBox(
                  height: 40,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          height: 20,
                          width: 20,
                          child:
                              Image.asset("assets/images${Styles.userFilled}")),
                      Container(
                          height: 5,
                          width: 5,
                          decoration: const BoxDecoration(
                              color: Styles.primaryGold,
                              shape: BoxShape.circle))
                    ],
                  ),
                ),
                icon: SizedBox(
                    height: 20,
                    width: 20,
                    child: Image.asset("assets/images${Styles.userOutlined}"))),
          ]),
    );
  }
}

class _MainClipper extends CustomClipper<Path> {
  final double percent;

  _MainClipper(this.percent);

  @override
  Path getClip(Size size) {
    final path = Path();
    path.addOval(Rect.fromCenter(
      center: Offset.zero,
      width: size.width * percent,
      height: size.height * percent,
    ));

    return path;
  }

  @override
  bool shouldReclip(covariant _MainClipper oldClipper) =>
      oldClipper.percent != percent;
}
