import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/components/header_component.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portofolio/components/header_link.dart';
import 'package:portofolio/components/lets_talk_button.dart';
import 'dart:html' as html;

import 'package:portofolio/components/social_link.dart';
import 'package:portofolio/utils/app_routes.dart';

class HomePage extends StatefulWidget {
  final Function(Locale) setLocale;

  const HomePage({super.key, required this.setLocale});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TextSpan> _buildTextSpans(String text) {
    final String highlight = 'PORTUGAL';
    final String highlightPT = 'PORTUGAL';

    // Split the text on the highlighted word and rebuild the text spans
    List<String> parts;
    if (text.contains(highlight)) {
      parts = text.split(highlight);
    } else if (text.contains(highlightPT)) {
      parts = text.split(highlightPT);
    } else {
      return [
        TextSpan(text: text)
      ]; // If no highlight word found, return whole text as one span
    }

    List<TextSpan> spans = [
      TextSpan(
        text: parts[0],
        style: GoogleFonts.quicksand(
            color: Colors.white, fontWeight: FontWeight.w500, fontSize: 24),
      ),
      TextSpan(
        text: highlight.contains(parts[1]) ? highlight : highlightPT,
        style: GoogleFonts.quicksand(
            color: Colors.orange, fontWeight: FontWeight.w900, fontSize: 24),
      ),
      TextSpan(text: parts.length > 1 ? parts[1] : ''),
    ];

    return spans;
  }

  void downloadCV() {
    final url = 'assets/Pedro_Guerra_CV.pdf'; // Path to your file in the assets
    final anchor = html.AnchorElement(href: url)
      ..setAttribute("download", "Pedro_Guerra_CV.pdf")
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
          child: HeaderComponent.appBar(widget.setLocale, context)
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // BODY
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              width: double.infinity,
              height: MediaQuery.sizeOf(context).height,
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // LEFT SIDE
                    Flexible(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.only(left: 128),
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.i_am,
                              style: GoogleFonts.quicksand(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 24,
                                  letterSpacing: 1.2,
                                  height: 0.1),
                            ),
                            Text(
                              "Pedro Guerra",
                              style: GoogleFonts.nunito(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 64,
                                  letterSpacing: 1.2),
                            ),
                            const SizedBox(
                              height: 0,
                            ),
                            Text.rich(TextSpan(
                                children: _buildTextSpans(
                                    AppLocalizations.of(context)!
                                        .mobile_developer))),
                            const SizedBox(
                              height: 40,
                            ),
                            Text(
                              AppLocalizations.of(context)!.me_description,
                              style: GoogleFonts.quicksand(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  letterSpacing: 1.2),
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            // TODO: BUTTONS
                            Row(
                              children: [
                                TextButton(
                                    onPressed: () {
                                      downloadCV();
                                    },
                                    style: ButtonStyle(
                                        backgroundColor: MaterialStateProperty
                                            .resolveWith(
                                                (states) => Colors.orange),
                                        padding:
                                        MaterialStateProperty.resolveWith(
                                                (states) => const EdgeInsets.symmetric(
                                                horizontal: 32,
                                                vertical: 24))),
                                    child: Row(
                                      children: [
                                        Text(
                                            AppLocalizations.of(context)!
                                                .download_cv,
                                            style: GoogleFonts.quicksand(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w900)),
                                        const SizedBox(
                                          width: 16,
                                        ),
                                        const Icon(
                                          FontAwesomeIcons.download,
                                          size: 24,
                                          color: Colors.white,
                                        ),
                                      ],
                                    )),
                                const SizedBox(
                                  width: 32,
                                ),
                                const SocialLink(
                                    icon: FontAwesomeIcons.linkedin,
                                    url:
                                    "https://www.linkedin.com/in/pedro-guerra-183934206/", hoverColor: Color.fromRGBO(14, 118, 168, 1),),
                                const SizedBox(
                                  width: 16,
                                ),
                                const SocialLink(
                                    icon: FontAwesomeIcons.github,
                                    url: "https://github.com/PedroGaP", hoverColor: Colors.black,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    // RIGHT SIDE
                    Flexible(
                      flex: 1,
                      child: Container(
                        width: double.infinity,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [Text("Image side")],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // TODO: Make Others sections to the web page

            // FOOTER
            Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Text(
                  AppLocalizations.of(context)!.all_rights_reserved,
                  style: GoogleFonts.quicksand(
                      fontSize: 14, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
