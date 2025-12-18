import 'dart:async';
import 'package:flutter/material.dart';
import '../../../../models/recent_race.dart';
import 'driver_standing_card.dart';

class DriverStandingsCarousel extends StatefulWidget {
  final List<Result> results;
  const DriverStandingsCarousel({super.key, required this.results});

  @override
  State<DriverStandingsCarousel> createState() =>
      _DriverStandingsCarouselState();
}

class _DriverStandingsCarouselState extends State<DriverStandingsCarousel> {
  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;

  static const double _cardWidth = 220.0; // 200 card + 20 spacing
  static const Duration _scrollDuration = Duration(milliseconds: 800);
  static const Duration _interval = Duration(seconds: 4);

  @override
  void initState() {
    super.initState();
    // Start after a short delay to ensure scroll controller is attached
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        _startAutoScroll();
      }
    });
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(_interval, (timer) async {
      if (!mounted || !_scrollController.hasClients) {
        timer.cancel();
        return;
      }

      final maxScroll = _scrollController.position.maxScrollExtent;
      final currentOffset = _scrollController.offset;

      // Calculate next position
      double nextOffset = currentOffset + _cardWidth;

      if (nextOffset >= maxScroll) {
        // Scroll to end first, then reset to beginning
        await _scrollController.animateTo(
          maxScroll,
          duration: _scrollDuration,
          curve: Curves.easeInOut,
        );

        // Wait a bit before resetting
        await Future.delayed(const Duration(milliseconds: 500));

        if (mounted && _scrollController.hasClients) {
          _scrollController.animateTo(
            0,
            curve: Curves.easeOut,
            duration: Duration(seconds: 2),
          );
        }
      } else {
        // Normal scroll to next card
        _scrollController.animateTo(
          nextOffset,
          duration: _scrollDuration,
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        controller: _scrollController,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: const BouncingScrollPhysics(),
        child: Row(
          children: [
            DriverStandingCard(
              position: int.parse(widget.results[0].position),
              driverName:
                  "${widget.results[0].driver.givenName} ${widget.results[0].driver.familyName}",
              teamName: widget.results[0].constructor.name,
              flagAsset: "assets/images/uk.svg",
              driverImage: "assets/images/max.png",
            ),
            const SizedBox(width: 20),
            DriverStandingCard(
              position: int.parse(widget.results[1].position),
              driverName:
                  "${widget.results[1].driver.givenName} ${widget.results[1].driver.familyName}",
              teamName: widget.results[1].constructor.name,
              flagAsset: "assets/images/uk.svg",
              driverImage: "assets/images/oscar.png",
            ),
            const SizedBox(width: 20),
            DriverStandingCard(
              position: int.parse(widget.results[2].position),
              driverName:
                  "${widget.results[2].driver.givenName} ${widget.results[2].driver.familyName}",
              teamName: widget.results[2].constructor.name,
              flagAsset: "assets/images/uk.svg",
              driverImage: "assets/images/lando.png",
            ),
          ],
        ),
      ),
    );
  }
}
