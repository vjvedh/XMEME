import 'dart:ui';

import 'package:flutter/material.dart';

Color darkGray = new Color.fromARGB(255, 32, 32, 32);
Color redColor = new Color.fromARGB(255, 250, 0, 0);
Color blueColor = new Color.fromARGB(255, 0, 0, 170);
Color purpleColor = new Color.fromARGB(255, 130, 0, 80);

const String HomeRoute = '/memes';
const String PostRoute = '/about';

class GlassCard extends StatelessWidget {
  final List<Widget> childItems;

  const GlassCard({Key key, this.childItems}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 26,
              spreadRadius: 16,
              color: Colors.black.withOpacity(0.2))
        ]),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(16.0)),
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 20.0,
              sigmaY: 20.0,
            ),
            child: Container(
              margin: EdgeInsets.all(5),
              height: size.height * 0.4,
              width: size.height * 0.5,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.all(Radius.circular(16.0)),
                  border: Border.all(
                      width: 1.5, color: Colors.white.withOpacity(0.2))),
              child: Column(
                children: childItems,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
