import 'package:flutter/material.dart';

class PacePoint {
  final double x;
  final double y;
  final int minisector;
  final int fastestDriver; 

  PacePoint({
    required this.x,
    required this.y,
    required this.minisector,
    required this.fastestDriver,
  });

  factory PacePoint.fromJson(Map<String, dynamic> json) {
    return PacePoint(
      x: json['x'].toDouble(),
      y: json['y'].toDouble(),
      minisector: json['minisector'],
      fastestDriver: json['fastest_driver'],
    );
  }
}

class TrackPainter extends CustomPainter {
  final List<PacePoint> points;

  TrackPainter(this.points);

  @override
  void paint(Canvas canvas, Size size) {
    if (points.length < 2) return;

    final minX = points.map((p) => p.x).reduce((a, b) => a < b ? a : b);
    final maxX = points.map((p) => p.x).reduce((a, b) => a > b ? a : b);
    final minY = points.map((p) => p.y).reduce((a, b) => a < b ? a : b);
    final maxY = points.map((p) => p.y).reduce((a, b) => a > b ? a : b);

    double scaleX = size.width / (maxX - minX);
    double scaleY = size.height / (maxY - minY);
    double scale = scaleX < scaleY ? scaleX : scaleY;

    Offset normalize(PacePoint p) {
      return Offset((p.x - minX) * scale, size.height - (p.y - minY) * scale);
    }

    for (int i = 0; i < points.length - 1; i++) {
      final p1 = normalize(points[i]);
      final p2 = normalize(points[i + 1]);

      final paint = Paint()
        ..color = points[i].fastestDriver == 1
            ? const Color(0xFF1E90FF) // Driver 1 = Blue
            : const Color(0xFFFF6347) // Driver 2 = Red
        ..strokeWidth = 5
        ..strokeCap = StrokeCap.round;

      canvas.drawLine(p1, p2, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class PaceComparisonView extends StatelessWidget {
  final List<PacePoint> data;

  const PaceComparisonView({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: CustomPaint(painter: TrackPainter(data), child: Container()),
    );
  }
}


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final List<PacePoint> dataPoints = [
    {"x": 2278.0, "y": -372.0, "minisector": 0, "fastest_driver": 2},
    {"x": 3764.0, "y": 1653.0, "minisector": 1, "fastest_driver": 1},
    {"x": 2753.0, "y": 1861.0, "minisector": 2, "fastest_driver": 1},
    {"x": 967.0, "y": 1437.0, "minisector": 3, "fastest_driver": 1},
    {"x": 464.0, "y": 3833.0, "minisector": 4, "fastest_driver": 2},
    {"x": 359.0, "y": 6670.0, "minisector": 5, "fastest_driver": 1},
    {"x": 253.0, "y": 9690.0, "minisector": 6, "fastest_driver": 1},
    {"x": 1072.0, "y": 10709.0, "minisector": 7, "fastest_driver": 2},
    {"x": 3610.0, "y": 11582.0, "minisector": 8, "fastest_driver": 1},
    {"x": 3464.0, "y": 12829.0, "minisector": 9, "fastest_driver": 1},
    {"x": 3606.0, "y": 14042.0, "minisector": 10, "fastest_driver": 2},
    {"x": 2073.0, "y": 14265.0, "minisector": 11, "fastest_driver": 2},
    {"x": -254.0, "y": 14343.0, "minisector": 12, "fastest_driver": 2},
    {"x": -2375.0, "y": 16718.0, "minisector": 13, "fastest_driver": 1},
    {"x": -4451.0, "y": 17769.0, "minisector": 14, "fastest_driver": 2},
    {"x": -5005.0, "y": 16973.0, "minisector": 15, "fastest_driver": 2},
    {"x": -6205.0, "y": 14697.0, "minisector": 16, "fastest_driver": 2},
    {"x": -7332.0, "y": 11650.0, "minisector": 17, "fastest_driver": 2},
    {"x": -7696.0, "y": 8370.0, "minisector": 18, "fastest_driver": 2},
    {"x": -7684.0, "y": 4940.0, "minisector": 19, "fastest_driver": 2},
    {"x": -7709.0, "y": 1632.0, "minisector": 20, "fastest_driver": 1},
    {"x": -7464.0, "y": -1230.0, "minisector": 21, "fastest_driver": 1},
    {"x": -6128.0, "y": -1713.0, "minisector": 22, "fastest_driver": 1},
    {"x": -3559.0, "y": -1659.0, "minisector": 23, "fastest_driver": 2},
    {"x": -530.0, "y": -1642.0, "minisector": 24, "fastest_driver": 2},
  ].map((e) => PacePoint.fromJson(e)).toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: PaceComparisonView(data: dataPoints)),
    );
  }
}
