import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/components/header_link.dart';
import 'package:portofolio/components/lets_talk_button.dart';
import 'package:portofolio/main.dart';
import 'package:portofolio/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderComponent extends StatefulWidget {
  final Function(Locale) setLocale;

  const HeaderComponent({super.key, required this.setLocale});

  @override
  State<HeaderComponent> createState() => _HeaderComponentState();
}

class _HeaderComponentState extends State<HeaderComponent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Header title
          TextButton(
            style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith((states) => Colors.transparent)
            ),
            onPressed: () {
              context.pushReplacement(AppRoutes.homeRoute);
            },
            child: Text(
              "Pedro Guerra".toUpperCase(),
              style: GoogleFonts.nunito(fontWeight: FontWeight.w900, color: Colors.white),
            ),
          ),

          // Header buttons
          Row(
            children: [
              HeaderLink(
                  linkText: AppLocalizations.of(context)!.home,
                  linkPath: AppRoutes.homeRoute,
                  isActive: true),
              HeaderLink(
                  linkText: AppLocalizations.of(context)!.about,
                  linkPath: AppRoutes.aboutRoute,
                  isActive: false),
              HeaderLink(
                  linkText: AppLocalizations.of(context)!.portfolio,
                  linkPath: AppRoutes.portfolioRoute,
                  isActive: false),
              const SizedBox(
                width: 16,
              ),
              LetsTalkButton(),
              // TODO: Change button to a icon button with the correspondent flag (PT or US)
              TextButton(
                  onPressed: () {
                    if (AppLocale.locale == Locale('pt')) {
                      widget.setLocale(Locale('en'));
                      AppLocale.locale = Locale('en');
                    } else {
                      widget.setLocale(Locale('pt'));
                      AppLocale.locale = Locale('pt');
                    }
                  },
                  child: const Text("Mudar Locale")),
            ],
          )
        ],
      ),
    );
  }
}
