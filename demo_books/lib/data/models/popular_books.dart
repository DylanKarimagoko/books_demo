class PopularBooks {
  // Demo model for popular books

  /*
  "title": "History of the Ancient World's Society",
      "author": "Dr. Tikendranath Sarkar",
      "rating": 4.0,
      "totalRatings": 50,
      "coverPhoto": ""
   */

  String title;
  String author;
  String coverPhoto;
  double ratings;
  int totalRatings;

  PopularBooks({
    required this.title,
    required this.author,
    required this.coverPhoto,
    required this.ratings,
    required this.totalRatings,
  });
}
