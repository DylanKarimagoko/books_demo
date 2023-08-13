import 'package:demo_books/data/data.dart';
import 'package:demo_books/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:glassmorphism/glassmorphism.dart';

class RecommendedWidget extends StatelessWidget {
  const RecommendedWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return UnconstrainedBox(
      child: TweenAnimationBuilder<double>(
          duration: 1000.ms,
          tween: Tween(begin: 1, end: 0),
          builder: (context, value, _) {
            return Container(
              width: size.width * .94,
              height: size.height * .46,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(
                          "assets/images/${Data.recommended["coverPhoto"]}"))),
              child: Stack(
                children: [
                  Positioned.fill(
                    bottom: 0,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10)),
                        child: GlassmorphicContainer(
                          width: size.width * .95,
                          height: size.height * .12,
                          borderRadius: 5,
                          blur: 16,
                          alignment: Alignment.bottomCenter,
                          border: 2,
                          linearGradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                const Color(0xFFffffff).withOpacity(0.1),
                                const Color(0xFFFFFFFF).withOpacity(0.05),
                              ],
                              stops: const [
                                0.1,
                                1,
                              ]),
                          borderGradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              const Color(0xFFffffff).withOpacity(0),
                              const Color((0xFFFFFFFF)).withOpacity(0),
                            ],
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: size.width * .47,
                                    child: Text(
                                      "${Data.recommended["title"]}",
                                      style: const TextStyle(
                                          color: Styles.secondaryWhite,
                                          fontFamily: Styles.dmSerifRegular,
                                          fontSize: Styles.recomendedTitle),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * .37,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          children: [
                                            GestureDetector(
                                              onTap: () {},
                                              child: Container(
                                                  alignment: Alignment.center,
                                                  width: 30,
                                                  height: 30,
                                                  decoration:
                                                      const BoxDecoration(
                                                          color: Styles
                                                              .secondaryWhite,
                                                          shape:
                                                              BoxShape.circle),
                                                  child: const Icon(
                                                    Icons.play_arrow,
                                                    size: 20,
                                                  )),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${Data.recommended['duration']}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      Styles.kantumruyRegular,
                                                  color: Styles.secondaryWhite,
                                                  fontSize: Styles
                                                      .recomendedDuration),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 3,
                                        ),
                                        Row(
                                          children: [
                                            const SizedBox(
                                                width: 30,
                                                height: 30,
                                                child: CircleAvatar(
                                                  foregroundImage: AssetImage(
                                                      "assets/images/dalby.jpg"),
                                                  backgroundColor:
                                                      Styles.secondaryGrey,
                                                )),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "${Data.recommended['author']}",
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      Styles.kantumruyRegular,
                                                  color: Styles.secondaryWhite,
                                                  fontSize: Styles
                                                      .recomendedDuration),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 13,
                    right: 10,
                    child: GlassmorphicContainer(
                      width: 52,
                      height: 52,
                      borderRadius: 10,
                      blur: 18,
                      alignment: Alignment.bottomCenter,
                      border: 2,
                      linearGradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            const Color(0xFFffffff).withOpacity(0.1),
                            const Color(0xFFFFFFFF).withOpacity(0.05),
                          ],
                          stops: const [
                            0.1,
                            1,
                          ]),
                      borderGradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          const Color(0xFFffffff).withOpacity(0),
                          const Color((0xFFFFFFFF)).withOpacity(0),
                        ],
                      ),
                      child: Center(
                          child: SizedBox(
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          "assets/images${Styles.bookmarkOutlined}",
                          color: Colors.white,
                        ),
                      )),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedContainer(
                        width: size.width * .94,
                        height: (size.height * .46) * value,
                        color: Styles.secondaryWhite,
                        duration: 1000.ms,
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
