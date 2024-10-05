import 'package:azkary_app/features/home/presentation/veiw/widgets/next_prayer_card.dart';
import 'package:azkary_app/features/home/presentation/veiw/widgets/prayer_times_card.dart';
import 'package:flutter/material.dart';

class BodyHomeScreen extends StatelessWidget {
  const BodyHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        NextPrayerCard(),
        PrayerTimesCard(),
      ],
    );
  }
}
