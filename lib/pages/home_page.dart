import 'package:flutter/material.dart';
import 'package:portofolio/components/header_component.dart';

class HomePage extends StatefulWidget {

  final Function(Locale) setLocale;

  const HomePage({super.key, required this.setLocale});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Text("Home Page", style: GoogleFonts.poppins(),),
          // HEADER
          HeaderComponent(setLocale: widget.setLocale)
          // BODY

          // FOOTER
        ],
      ),
    );
  }
}
