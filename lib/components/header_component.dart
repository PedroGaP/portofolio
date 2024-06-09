import 'package:country_flags/country_flags.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portofolio/components/header_link.dart';
import 'package:portofolio/components/lets_talk_button.dart';
import 'package:portofolio/main.dart';
import 'package:portofolio/utils/app_routes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HeaderComponent {

  static AppBar Function(Function(Locale), BuildContext) appBar = (Function setLocale, BuildContext context) {

    bool isPortuguese() {
      return AppLocale.locale == const Locale('pt');
    }

    return AppBar(
      actions: [
        HeaderLink(
            linkText: AppLocalizations.of(context)!.home,
            linkPath: AppRoutes.homeRoute,
            isActive: true),
        HeaderLink(
            linkText: AppLocalizations.of(context)!.about,
            linkPath: AppRoutes.aboutRoute,
            isActive: false),
        const HeaderLink(
            linkText: "Skills",
            linkPath: AppRoutes.portfolioRoute,
            isActive: false),
        HeaderLink(
            linkText: AppLocalizations.of(context)!.portfolio,
            linkPath: AppRoutes.portfolioRoute,
            isActive: false),
        const SizedBox(
          width: 16,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
          child: LetsTalkButton(),
        ),
        // TODO: Change button to a icon button with the correspondent flag (PT or US)
        const SizedBox(width: 16,),
        Padding(
          padding: const EdgeInsets.only(top: 20, right: 20),
          child: Tooltip(
            message: isPortuguese() ? 'Change to English' : 'Mudar para Português',
            child: InkWell(
              onTap: () {
                Locale newLocale = isPortuguese() ? Locale('en') : Locale('pt');
                setLocale(newLocale);
                AppLocale.locale = newLocale;
              },
              child: CountryFlag.fromCountryCode(
                isPortuguese() ? 'us' : 'pt',
                height: 30,
                width: 50,
              ),
            ),
          ),
        ),
      ],
      title: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, ),
        child: TextButton(
          style: ButtonStyle(
              overlayColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.transparent)),
          onPressed: () {
            context.pushReplacement(AppRoutes.homeRoute);
          },
          child: Text(
            "Pedro Guerra".toUpperCase(),
            style: GoogleFonts.nunito(
                fontWeight: FontWeight.w900, color: Colors.orange, fontSize: 16),
          ),
        ),
      ),
      elevation: 0,
      forceMaterialTransparency: false,
    );
  };

}
