import 'package:demo_books/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class BookWidget extends StatelessWidget {
  const BookWidget({super.key, required this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: size.width * .025, vertical: 2.5),
      child: SizedBox(
        height: 80,
        child: Row(children: [
          Container(
            width: 75,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage("assets/images/${data["coverPhoto"]}")),
                borderRadius: BorderRadius.circular(8)),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: size.width * .72,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "${data['title']}",
                style: const TextStyle(
                    fontFamily: Styles.dmSerifRegular,
                    fontSize: Styles.bookTitle),
                overflow: TextOverflow.ellipsis,
              ),
              Text(
                "${data["author"]}",
                style: const TextStyle(
                    color: Styles.secondaryGrey, fontSize: Styles.bookAuthor),
              ),
              Row(
                children: [
                  RatingBar.builder(
                    itemSize: 14,
                    itemCount: 5,
                    initialRating: data['rating'],
                    direction: Axis.horizontal,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Styles.primaryGold,
                    ),
                    onRatingUpdate: (double value) {},
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${data["totalRatings"]} Ratings",
                    style: const TextStyle(
                        color: Styles.secondaryGrey,
                        fontSize: Styles.bookRatings),
                  )
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}
