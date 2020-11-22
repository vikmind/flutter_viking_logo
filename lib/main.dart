import 'dart:math';
import 'dart:ui' as ui show Gradient;

import 'package:flutter/material.dart';

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
      home: MyHomePage(title: 'Flutter Vikings Logo'),
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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    );
    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Theme.of(context).canvasColor,
            ),
          ),
          child: FadeTransition(
            opacity: animation,
            child: SizedBox(
              width: 200,
              height: 200,
              child: AspectRatio(
                aspectRatio: WIDTH / HEIGHT,
                child: CustomPaint(
                  size: Size(WIDTH, HEIGHT),
                  painter: LogoPainter(animation),
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (controller.isCompleted) {
            controller.reverse();
          }
          if (controller.isDismissed) {
            controller.forward();
          }
        },
        child: Icon(Icons.animation),
      ),
    );
  }
}

class LogoPainter extends CustomPainter {
  final Animation<double> animation;
  LogoPainter(this.animation) : super(repaint: animation);

  Path _leftStripe;
  Path get leftStripe {
    if (_leftStripe != null) return Path.from(_leftStripe);
    _leftStripe = Path();
    _leftStripe.moveTo(392.09, 163.01);
    _leftStripe.relativeLineTo(186.31, 186.32);
    _leftStripe.relativeLineTo(-514.76, 514.76);
    _leftStripe.relativeCubicTo(-23.32, 23.32, -63.18, 6.8, -63.18, -26.17);
    _leftStripe.relativeLineTo(0, -318.46);
    _leftStripe.relativeCubicTo(0, -9.82, 3.9, -19.23, 10.84, -26.17);
    _leftStripe.relativeLineTo(330.28, -330.28);
    _leftStripe.relativeCubicTo(13.95, -13.94, 36.56, -13.94, 50.51, 0);
    return Path.from(_leftStripe);
  }

  Path _rightStripe;
  Path get rightStripe {
    if (_rightStripe != null) return Path.from(_rightStripe);
    _rightStripe = Path();
    _rightStripe.moveTo(340.67, 163.93);
    _rightStripe.relativeLineTo(-185.4, 185.4);
    _rightStripe.relativeLineTo(514.76, 514.76);
    _rightStripe.relativeCubicTo(23.32, 23.32, 63.18, 6.8, 63.18, -26.17);
    _rightStripe.relativeLineTo(0, -318.46);
    _rightStripe.relativeCubicTo(0, -9.82, -3.9, -19.23, -10.84, -26.17);
    _rightStripe.relativeLineTo(-329.36, -329.36);
    _rightStripe.relativeCubicTo(-14.46, -14.46, -37.89, -14.46, -52.34, 0);
    return Path.from(_rightStripe);
  }

  Path _gradient;
  Path get gradient {
    if (_gradient != null) return Path.from(_gradient);
    _gradient = Path();
    _gradient.moveTo(366.84, 560.89);
    _gradient.relativeLineTo(-211.57, -211.56);
    _gradient.relativeLineTo(134.13, 289);
    return Path.from(_gradient);
  }

  Path _rightHorn;
  Path get rightHorn {
    if (_rightHorn != null) return Path.from(_rightHorn);
    _rightHorn = Path();
    _rightHorn.moveTo(603.9, 1.38);
    _rightHorn.relativeCubicTo(0, 0, 59.85, 179.05, -14.77, 243.66);
    _rightHorn.relativeCubicTo(0, 0, 86.5, 48.26, 108.35, 111.08);
    _rightHorn.relativeCubicTo(-.01, 0, 126.09, -169.51, -93.58, -354.74);
    return Path.from(_rightHorn);
  }

  Path _rightBase;
  Path get rightBase {
    if (_rightBase != null) return Path.from(_rightBase);
    _rightBase = Path();
    _rightBase.moveTo(661.55, 420.26);
    _rightBase.relativeCubicTo(0, 0, 51.6, -27.58, 26.62, -72.4);
    _rightBase.relativeCubicTo(-9, -26.62, -103.41, -107.25, -116.96, -102.05);
    _rightBase.relativeCubicTo(0, 0, -54.9, 28.28, -54.9, 28.28);
    _rightBase.relativeCubicTo(0, 0, 111.98, 70.1, 145.24, 146.17);
    return Path.from(_rightBase);
  }

  Path _leftHorn;
  Path get leftHorn {
    if (_leftHorn != null) return Path.from(_leftHorn);
    _leftHorn = Path();
    _leftHorn.moveTo(129.66, .38);
    _leftHorn.relativeCubicTo(0, 0, -59.85, 179.05, 14.77, 243.66);
    _leftHorn.relativeCubicTo(0, 0, -86.5, 48.26, -108.35, 111.08);
    _leftHorn.relativeCubicTo(0, 0, -126.1, -169.51, 93.58, -354.74);
    return Path.from(_leftHorn);
  }

  Path _leftBase;
  Path get leftBase {
    if (_leftBase != null) return Path.from(_leftBase);
    _leftBase = Path();
    _leftBase = Path();
    _leftBase.moveTo(72.02, 420.26);
    _leftBase.relativeCubicTo(0, 0, -51.6, -27.58, -26.62, -72.4);
    _leftBase.relativeCubicTo(3, -20, 103.41, -107.25, 116.96, -102.05);
    _leftBase.relativeCubicTo(0, 0, 54.9, 28.28, 54.9, 28.28);
    _leftBase.relativeCubicTo(0, 0, -111.98, 70.1, -145.24, 146.17);
    return Path.from(_leftBase);
  }

  Paint get lightPaint => Paint()..color = LIGHT_BLUE;
  Paint get darkPaint => Paint()..color = DARK_BLUE;

  Paint get gradientPaint {
    final gradientColor =
        HSLColor.fromColor(Color(0xFF055799)).withLightness(.25);
    return Paint()
      ..shader = ui.Gradient.linear(
        Offset(128.7, 289.6),
        Offset(304, 429),
        [gradientColor.toColor(), Color(0xFF055799)],
      );
  }

  @override
  void paint(Canvas canvas, Size size) {
    // Prepare
    canvas.translate(121 * (size.width / WIDTH), 23 * (size.width / WIDTH));
    canvas.scale(size.width / WIDTH);

    // Animate
    // canvas.scale(animation.value);
    // canvas.rotate(pi*2*animation.value);

    // Draw
    canvas.drawPath(
        leftStripe.shift(
          Offset(
            100 * (1 - animation.value),
            100 * (1 - animation.value),
          ),
        ),
        darkPaint);
    canvas.drawPath(rightStripe,
        lightPaint..color = LIGHT_BLUE.withOpacity(animation.value));
    if (animation.value > 0.9) {
      canvas.drawPath(gradient, gradientPaint);
    }

    canvas.drawPath(rightHorn, lightPaint);
    canvas.drawPath(rightBase, darkPaint);

    canvas.drawPath(leftHorn, darkPaint);
    canvas.drawPath(leftBase, lightPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
