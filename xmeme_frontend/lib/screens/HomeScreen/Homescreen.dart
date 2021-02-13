import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:xmeme_frontend/models/global.dart';
import 'package:xmeme_frontend/screens/IntrayPage/IntrayPage.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState(title);
}

class _MyHomePageState extends State<MyHomePage> {
  _MyHomePageState(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      title: title,
      home: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: new Scaffold(
            body: Stack(children: <Widget>[
              TabBarView(
                children: [
                  new IntrayPage(),
                  new Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          redColor,
                          purpleColor,
                          blueColor,
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 140,
                width: size.width,
                color: Colors.white,
                child: Stack(children: <Widget>[
                  CustomPaint(
                      size: Size(size.width, 140), painter: BNBCustomPainter()),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Center(
                        child: Text("X_Meme",
                            style: GoogleFonts.pacifico(
                                fontWeight: FontWeight.bold,
                                color: Colors.amberAccent[700],
                                fontSize: size.width * 0.03)),
                      ),
                      Center(
                        child: Container(
                          height: size.width * 0.038,
                          width: size.width * 0.05,
                          child: RawMaterialButton(
                            elevation: 1.0,
                            shape: CircleBorder(),
                            fillColor: Colors.red,
                            onPressed: () {},
                            child: Icon(Icons.add,
                                color: Colors.white, size: size.width * 0.03),
                            constraints: BoxConstraints.tightFor(
                              width: 200.0,
                              height: 200.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ]),
            appBar: AppBar(
              elevation: 0,
              title: new TabBar(
                tabs: [
                  Tab(
                      icon: new Icon(
                    Icons.art_track_rounded,
                    size: 50,
                  )),
                  Tab(
                    icon: new Icon(
                      Icons.add_a_photo_rounded,
                      size: 35,
                    ),
                  ),
                ],
                labelColor: darkGray,
                unselectedLabelColor: Colors.blue,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorPadding: EdgeInsets.all(5.0),
                indicatorColor: Colors.transparent,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()..style = PaintingStyle.fill;

    Path path = Path();
    path.moveTo(0, 112); // Start
    path.quadraticBezierTo(size.width * 0.20, 140, size.width * 0.35, 140);
    path.quadraticBezierTo(size.width * 0.40, 140, size.width * 0.40, 120);
    path.arcToPoint(Offset(size.width * 0.60, 120),
        radius: Radius.circular(20.0), clockwise: true);
    path.quadraticBezierTo(size.width * 0.60, 140, size.width * 0.65, 140);
    path.quadraticBezierTo(size.width * 0.80, 140, size.width, 120);
    path.lineTo(size.width, 140);
    path.lineTo(0, 140);
    path.lineTo(0, 120);
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
