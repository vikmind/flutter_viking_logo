import 'dart:typed_data';
import 'dart:ui' as ui show Gradient;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:svg_path_parser/svg_path_parser.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Painter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

const WIDTH = 977.0;
const HEIGHT = 927.0;
const LIGHT_BLUE = Color(0xFF07c6f9);
const DARK_BLUE = Color(0xFF055799);

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: .2,
              child: SvgPicture.asset(
                'assets/logo.svg',
                width: WIDTH,
                height: HEIGHT,
              ),
            ),
            SizedBox(
              width: WIDTH,
              child: AspectRatio(
                aspectRatio: WIDTH / HEIGHT,
                child: CustomPaint(
                  size: Size(WIDTH, HEIGHT),
                  painter: LogoPainter(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print(size);
    final lightPaint = Paint()..color = LIGHT_BLUE;
    final darkPaint = Paint()..color = DARK_BLUE;
    Path leftStripe = parseSvgPath(
        "m392.09 163.01 186.31 186.32-514.76 514.76c-23.32 23.32-63.18 6.8-63.18-26.17v-318.46c0-9.82 3.9-19.23 10.84-26.17l330.28-330.28c13.95-13.94 36.56-13.94 50.51 0z");
    leftStripe = scaleDown(leftStripe, size);

    Path rightStripe = parseSvgPath(
        "m340.67 163.93-185.4 185.4 514.76 514.76c23.32 23.32 63.18 6.8 63.18-26.17v-318.46c0-9.82-3.9-19.23-10.84-26.17l-329.36-329.36c-14.46-14.46-37.89-14.46-52.34 0z");
    rightStripe = scaleDown(rightStripe, size);

    Path gradient = parseSvgPath("m366.84 560.89-211.57-211.56 134.13 289z");
    gradient = scaleDown(gradient, size);
    print(gradient.getBounds());

    final gradientColor =
        HSLColor.fromColor(Color(0xFF055799)).withLightness(.25);
    final gradientPaint = Paint()
      ..shader = ui.Gradient.linear(
        Offset(128.7, 289.6),
        Offset(304, 429),
        [gradientColor.toColor(), Color(0xFF055799)],
      );

    /// Right HORN
    /// m603.9 1.38
    /// s59.85 179.05 -14.77 243.66
    /// c0 0 86.5 48.26 108.35 111.08
    /// c-.01 0 126.09 -169.51 -93.58 -354.74
    Path rightHorn = Path();
    rightHorn.lineTo(603.9, 1.38);
    rightHorn.cubicTo(
      603.9,
      1.38,
      603.9 + 59.85,
      1.38 + 179.05,
      603.9 - 14.77,
      1.38 + 243.66,
    );
    rightHorn.cubicTo(
      603.9 - 14.77,
      1.38 + 243.66,
      603.9 - 14.77 + 86.5,
      1.38 + 243.66 + 48.26,
      603.9 - 14.77 + 108.35,
      1.38 + 243.66 + 111.08,
    );
    rightHorn.cubicTo(
      603.9 - 14.77 + 108.35-.01,
      1.38 + 243.66 + 111.08,
      603.9 - 14.77 + 108.35+ 126.09,
      1.38 + 243.66 + 111.08-169.51,
      603.9 - 14.77 + 108.35-93.58,
      1.38 + 243.66 + 111.08-354.74,
    );
    rightHorn = scaleDown(rightHorn, size);

    /// Right base
    /// m129.66.38
    /// s-59.85 179.05 14.77 243.66
    /// c0 0 -86.5 48.26 -108.35 111.08
    /// c0 0 -126.1 -169.51 93.58-354.74
    Path rightBase = Path();
    rightBase = scaleDown(rightBase, size);

    /// Left horn
    /// m661.55 420.26
    /// s51.6 -27.58 26.62 -72.4
    /// s-103.41 -107.25 -116.96 -102.05
    /// s-54.9 28.28 -54.9 28.28
    /// s111.98 70.1 145.24 146.17
    Path leftHorn = Path();
    leftHorn = scaleDown(leftHorn, size);


    /// Left base
    /// m72.02 420.26
    /// s-51.6 -27.58 -26.62 -72.4
    /// s103.41 -107.25 116.96 -102.05
    /// s54.9 28.28 54.9 28.28
    /// s-111.98 70.1-145.24 146.17
    Path leftBase = Path();
    leftBase = scaleDown(leftBase, size);

    canvas.drawPath(leftStripe, darkPaint);
    canvas.drawPath(rightStripe, lightPaint);
    canvas.drawPath(gradient, gradientPaint);
    canvas.drawPath(rightHorn, lightPaint);
    // canvas.drawPath(leftHorn, darkPaint);
    // canvas.drawPath(rightBase, darkPaint);
    // canvas.drawPath(leftBase, lightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

Path scaleDown(Path path, Size size) => path.transform(
      Float64List.fromList([
        1,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        0,
        1 / (size.width / WIDTH),
      ]),
    );
