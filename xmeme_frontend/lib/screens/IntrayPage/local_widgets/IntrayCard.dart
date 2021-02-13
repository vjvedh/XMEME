import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xmeme_frontend/models/global.dart';

class IntrayCard extends StatelessWidget {
  final String user, caption, imageLink;
  IntrayCard({this.user, this.caption, this.imageLink});

  @override
  Widget build(BuildContext context) {
    final List<Widget> childItems = <Widget>[
      Text(
        user,
        style: GoogleFonts.cinzel(
            color: Colors.amber, fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Text(
        caption,
        style: GoogleFonts.lato(fontSize: 15, fontWeight: FontWeight.w700),
      ),
      Flexible(
        fit: FlexFit.loose,
        child: Image.network(
          imageLink,
          fit: BoxFit.cover,
        ),
      ),
    ];

    return GlassCard(
      childItems: childItems,
    );
  }
}
