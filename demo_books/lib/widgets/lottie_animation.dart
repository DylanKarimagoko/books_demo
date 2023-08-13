import 'package:demo_books/utils/styles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class DemoWidget extends StatelessWidget {
  const DemoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const style = TextStyle(
        color: Colors.black, fontSize: 15, fontWeight: FontWeight.normal);
    const styleLink = TextStyle(
        color: Styles.primaryGold, fontSize: 17, fontWeight: FontWeight.bold);
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.height * .15,
          ),
          SizedBox(
            width: size.width,
            child: Lottie.asset("assets/animation/animation.json",
                fit: BoxFit.fill, alignment: Alignment.centerLeft),
          ),
          SizedBox(
            width: size.width * .9,
            child: RichText(
                text: TextSpan(text: Styles.demo, style: style, children: [
              TextSpan(
                  text: Styles.thisText,
                  style: styleLink,
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      final dribbleLink =
                          Uri(scheme: "https", path: Styles.designLink);

                      try {
                        launchUrl(dribbleLink);
                      } catch (e) {
                        showError("Failed to launch", context);
                      }
                    },
                  children: [
                    TextSpan(text: Styles.designBy, style: style, children: [
                      TextSpan(
                          style: styleLink,
                          text: Styles.nickelFox,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              final dribbleLink = Uri(
                                  scheme: "https", path: Styles.nickelFoxLink);

                              try {
                                launchUrl(dribbleLink);
                              } catch (e) {
                                showError("Failed to launch", context);
                              }
                            },
                          children: [
                            TextSpan(
                                text: Styles.forQueries,
                                style: style,
                                children: [
                                  TextSpan(
                                      style: styleLink,
                                      text: Styles.email,
                                      recognizer: TapGestureRecognizer()
                                        ..onTap = () {
                                          String? encodeQueryParameters(
                                              Map<String, String> params) {
                                            return params.entries
                                                .map((MapEntry<String, String>
                                                        e) =>
                                                    '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                .join('&');
                                          }

// ···
                                          final Uri emailLaunchUri = Uri(
                                            scheme: 'mailto',
                                            path: Styles.email,
                                            query:
                                                encodeQueryParameters(<String,
                                                    String>{
                                              'subject': 'Book Demo Project',
                                            }),
                                          );
                                          try {
                                            launchUrl(emailLaunchUri);
                                          } catch (e) {
                                            showError(
                                                "Failed to launch", context);
                                          }
                                        },
                                      children: [
                                        TextSpan(
                                            text: Styles.orApp,
                                            style: style,
                                            children: [
                                              TextSpan(
                                                text: " here",
                                                style: styleLink,
                                                recognizer:
                                                    TapGestureRecognizer()
                                                      ..onTap = () {
// ···
                                                        final Uri whatsapp =
                                                            Uri.parse(
                                                                "https://api.whatsapp.com/send/?phone=${Styles.app}");
                                                        try {
                                                          launchUrl(whatsapp,
                                                              mode: LaunchMode
                                                                  .externalApplication);
                                                        } catch (e) {
                                                          showError(
                                                              "Failed to launch",
                                                              context);
                                                        }
                                                      },
                                              )
                                            ])
                                      ])
                                ])
                          ])
                    ])
                  ])
            ])),
          )
        ]);
  }

  showError(String error, BuildContext context) {
    final snackBar = SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(error),
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
