import 'package:flutter/material.dart';
import 'dart:js' as js;

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SocialLink extends StatefulWidget {
  final IconData icon;
  final String url;
  final Color hoverColor;

  const SocialLink(
      {super.key,
      required this.icon,
      required this.url,
      required this.hoverColor});

  @override
  State<SocialLink> createState() => _SocialLinkState();
}

class _SocialLinkState extends State<SocialLink> {
  late bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (bool val) {
        setState(() {
          isHover = val;
        });
      },
      onTap: () {
        js.context.callMethod('open', [widget.url]);
      },

      // TODO: Finish Social Link buttons style
      child: Container(
          child: Icon(
                  widget.icon,
                  size: isHover ? double.infinity : 32,
                  color: isHover ? widget.hoverColor : Colors.white,
                )),
    );
  }
}
