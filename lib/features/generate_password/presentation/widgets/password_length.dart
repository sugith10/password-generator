import 'dart:math' as math;
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

import '../../../../core/const/constants.dart';
import '../../../../core/util/utils.dart';
import '../bloc/password_generate_bloc.dart';

class PasswordLength extends StatelessWidget {
  const PasswordLength({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordGenratorBloc, PasswordGenratorState>(
      builder: (BuildContext context, PasswordGenratorState state) {
        return const SliderWidget();
      },
    );
  }
}

class CircularSliderTrackShape extends SliderTrackShape {
  const CircularSliderTrackShape({
    required this.gradient,
  });

  final Gradient gradient;

  @override
  Rect getPreferredRect({
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    Offset offset = Offset.zero,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    final double trackHeight = sliderTheme.trackHeight ?? 4;
    final double trackLeft = offset.dx;
    final double trackTop = offset.dy;
    final double trackWidth = parentBox.size.width;
    final double trackBottom = parentBox.size.height;
    return Rect.fromLTRB(trackLeft, trackTop, trackWidth, trackBottom);
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    required TextDirection textDirection,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
  }) {
    if (sliderTheme.trackHeight == 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );
    final double radius = math.min(trackRect.width, trackRect.height) / 2;
    final Offset center = trackRect.center;

    final Paint paint = Paint()
      ..shader = gradient.createShader(trackRect)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = sliderTheme.trackHeight ?? 4;

    // Draw background track
    context.canvas.drawCircle(
      center,
      radius,
      paint..color = Colors.grey.withValues(alpha: 0.2),
    );

    // Draw active track
    const double startAngle = -math.pi / 2; // Start from top
    final double sweepAngle = 2 * math.pi * (thumbCenter.dx / trackRect.width);

    final Path path = Path()
      ..addArc(
        Rect.fromCircle(center: center, radius: radius),
        startAngle,
        sweepAngle,
      );

    context.canvas
        .drawPath(path, paint..shader = gradient.createShader(trackRect));
  }
}

class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  _SliderWidgetState createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {
  double progressVal = 0.5;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kDiameter,
      height: kDiameter,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Transform.scale(
            scale: 1,
            child: ShaderMask(
              shaderCallback: (Rect rect) {
                return SweepGradient(
                  startAngle: degToRad(180).toDouble(),
                  endAngle: degToRad(360).toDouble(),
                  colors: <Color>[
                    primaryColor,
                    Colors.grey.withAlpha(50),
                  ],
                  stops: <double>[progressVal, progressVal],
                ).createShader(rect);
              },
              child: const CustomArc(),
            ),
          ),
          Container(
            width: kDiameter - 40,
            height: kDiameter - 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: trackBg,
                width: 20,
              ),
            ),
            child: SleekCircularSlider(
              min: kMinDegree,
              max: kMaxDegree,
              initialValue: kMinDegree,
              appearance: CircularSliderAppearance(
                startAngle: 180,
                angleRange: 180,
                size: kDiameter - 30,
                customWidths: CustomSliderWidths(
                  trackWidth: 15,
                  shadowWidth: 0,
                  progressBarWidth: 01,
                  handlerSize: 15,
                ),
                customColors: CustomSliderColors(
                  hideShadow: true,
                  progressBarColor: Colors.transparent,
                  trackColor: const Color(0xFF20201e),
                  dotColor: thumb,
                ),
              ),
              onChange: (double value) {
                setState(() {
                  progressVal =
                      normalize(value, kMinDegree, kMaxDegree).toDouble();
                });
                context.read<PasswordGenratorBloc>().add(
                      ChangePasswordLengthEvent(
                        passwordLength: value.toInt(),
                      ),
                    );
              },
              innerWidget: (double value) {
                return Center(
                  child: Text(
                    '${value.toInt()}',
                    style: const TextStyle(
                      fontSize: 50,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CustomArc extends StatelessWidget {
  const CustomArc({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CustomArcPainter(),
      size: const Size(kDiameter, kDiameter),
    );
  }
}

class CustomArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = primaryColor
      ..strokeWidth = 4.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeJoin = StrokeJoin.round;

    final Path path = Path()
      ..moveTo(0, size.height / 2)
      ..addArc(
        Rect.fromCenter(
          center: Offset(size.height / 2, size.width / 2),
          width: size.width,
          height: size.height,
        ),
        pi,
        pi,
      );

    final Path dashPath = Path();
    const double dashWidth = 9;
    const double dashSpace = 10;
    double distance = 3;

    for (PathMetric pathMetric in path.computeMetrics()) {
      while (distance < pathMetric.length) {
        dashPath.addPath(
          pathMetric.extractPath(distance, distance + dashWidth),
          Offset.zero,
        );
        distance += dashWidth;
        distance += dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
