import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderLink extends StatefulWidget {
  final String linkText;
  final String linkPath;
  final bool? isActive;

  const HeaderLink(
      {super.key, required this.linkText, required this.linkPath, this.isActive});

  @override
  State<HeaderLink> createState() => _HeaderLinkState();
}

class _HeaderLinkState extends State<HeaderLink> {

  late bool isBackgroundActive = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: isBackgroundActive ? Colors.white.withOpacity(0.2) : Colors.transparent ,
        ),
        padding: EdgeInsets.all(8),
        child: TextButton(
            style: ButtonStyle(
                overlayColor: MaterialStateProperty.resolveWith((states) =>
                Colors.transparent),
            ),
            onHover: (value) {
              setState(() {
                isBackgroundActive = !isBackgroundActive;
              });
            },
            onPressed: () {
              context.goNamed(widget.linkPath);
            },
            child: Text(
              widget.linkText,
              style: GoogleFonts.quicksand(
                  color: (widget.isActive ?? false) || isBackgroundActive ? Colors.orange : Colors.white
                      .withOpacity(0.5),
                  fontWeight: widget.isActive ?? false
                      ? FontWeight.w800
                      : FontWeight.w500
              ),
            )),
      ),
    );
  }
}
