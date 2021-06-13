import 'dart:async';
import 'dart:math';

import 'package:analog_app/core/my_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../constants.dart';
import 'clock_painter.dart';

class Clock extends StatefulWidget {
  Clock({Key key}) : super(key: key);

  @override
  _ClockState createState() => _ClockState();
}

class _ClockState extends State<Clock> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _dateTime = DateTime.now();
      });
    });
  }

  DateTime _dateTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 0),
                        color: kShadowColor.withOpacity(
                            context.watch<MyThemeProvider>().themeMode
                                ? 0.50
                                : 0.40),
                        blurRadius: 32)
                  ]),
              child: Transform.rotate(
                angle: -pi / 2,
                child: CustomPaint(
                  painter: ClockPainter(context: context, dateTime: _dateTime),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          child: Consumer<MyThemeProvider>(
            builder: (context, theme, child) {
              return GestureDetector(
                onTap: () {
                  theme.changeThemeState();
                },
                child: SvgPicture.asset(
                  theme.themeMode
                      ? "assets/icons/Sun.svg"
                      : "assets/icons/Moon.svg",
                  color: Theme.of(context).primaryColor,
                  height: 24,
                  width: 24,
                ),
              );
            },
          ),
          top: 40,
          right: 0,
          left: 0,
        )
      ],
    );
  }
}
