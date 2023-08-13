import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

abstract class Styles {
// Link to the color and font sheet
//https://cdn.dribbble.com/userupload/4359813/file/original-23c07bf132013180a72622eac704f89d.png?resize=1024x768&vertical=center
//Normally would split all these into different files
//eg dimensions.dart, colors.dart, styles.dart, strings.dart

//Primary Colors

  static const primaryBlack = Color(0xff2F2F2F);
  static const primaryGold = Color(0xffBFA054);

// Secondary Colors

  static const secondaryGrey = Color(0xff858585);
  static const secondaryBrown =
      Color(0xffF5EFE1); // Might be gold but looks brown
  static const secondaryWhite = Color(0xffFBF8F2);

// Fonts

// Files are located inside the assets/fonts
//Kantumruy font
  static const String kantumruyLight = "kantumruyLight";
  static const String kantumruyRegular = "kantumruyRegular";
  static const String kantumruyBold = "kantumruyBold";

  //Dm Serif display

  static const String dmSerifRegular = "dmSerifRegular";

  // Icons

  //Home

  static const String homeFilled = "/home/home_filled.png";
  static const String homeOutlined = "/home/home_outlined.png";

//Market

  static const String marketFilled = "/market/market_filled.png";
  static const String marketOutlined = "/market/market_outlined.png";

//Book Marker

  static const String bookmarkFilled = "/bookmark/bookmark _filled.png";
  static const String bookmarkOutlined = "/bookmark/bookmark_outlined.png";

//User

  static const String userFilled = "/user/user_filled.png";
  static const String userOutlined = "/user/user_outlined.png";

  static IconData back = MdiIcons.keyboardBackspace;
  static const String bell = "bell.png";
  static const String search = "search.png";

  //Logo

  static const String logo = "logo.jpg";

  // font sizes

  static const double recomendedTitle = 18;
  static const double booksTitle = 23;
  static const double bookInfoTitle = 20;
  static const double recomendedDuration = 14;

  static const double bookTitle = 15;
  static const double bookAuthor = 13;
  static const double bookRatings = 12;

  static const double marketbookTitle = 17;
  static const double infoTabs = 16;
  static const double price = 19;

  static const String headingHome = "Popular Books";

  static const int duration = 250;
  static const int fadeDuration = 150;

  static const String exploreMarket = "Explore Market";
  static const String exploreCollection = "Collection";
  static const String account = "Account";

  static const String bookInfo = "Book Info";

  static const String demo = "This is a demo application based on ";
  static const String thisText = "this";
  static const String designBy = " design by ";
  static const String nickelFox = "Nickelfox.";
  static const String forQueries =
      " If you have a design or you want to work with me email ";
  static const String email = "nitrocodetech@gmail.com";
  static const String orApp = " or Whatsapp";

  static const String nickelFoxLink = "dribbble.com/NickelfoxStudio";
  static const String designLink =
      "dribbble.com/shots/20438659-Audiobooks-Mobile-App-design-iOS-Android-ux-ui-designer";
  static const String app = "263786232255";
}
