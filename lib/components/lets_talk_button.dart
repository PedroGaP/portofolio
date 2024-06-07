import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class LetsTalkButton extends StatelessWidget {
  const LetsTalkButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      color: Colors.white,
        style: ButtonStyle(
          padding: MaterialStateProperty.resolveWith((states) => EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
          backgroundColor: MaterialStateProperty.resolveWith((states) => Colors.blue)
        ),
        onPressed: () {},
        icon: Row(
          children: [
            Text(AppLocalizations.of(context)!.lets_talk, style: GoogleFonts.quicksand(
              color: Colors.white,
              fontWeight: FontWeight.w800
            )),
            const SizedBox(width: 8,),
            Icon(Icons.arrow_outward)
          ],
        ));
  }
}
