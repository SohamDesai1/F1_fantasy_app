import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../utils/race_utils.dart';

class DriverStandingCard extends StatelessWidget {
  final int position;
  final String driverName;
  final String teamName;
  final String flagAsset;
  final String driverImage;

  const DriverStandingCard({
    super.key,
    required this.position,
    required this.driverName,
    required this.teamName,
    required this.flagAsset,
    required this.driverImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: RaceUtils.getF1TeamGradient(teamName),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            blurRadius: 10,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "P${position.toString()}",
                  style: const TextStyle(
                    fontSize: 28,
                    fontFamily: 'Formula1Bold',
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 30),

                SvgPicture.asset(flagAsset, width: 30, height: 40),

                const Spacer(),

                Text(
                  driverName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  teamName.toUpperCase(),
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -10,
            bottom: 80,
            child: SizedBox(
              height: 200,
              width: 120,
              child: Image.asset(driverImage, height: 150),
            ),
          ),
        ],
      ),
    );
  }
}
