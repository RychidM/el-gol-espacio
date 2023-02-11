import 'package:flutter/cupertino.dart';
import 'package:livescore/resources/app_font.dart';

class StandingView extends StatefulWidget {
  const StandingView({super.key});

  @override
  State<StandingView> createState() => _StandingViewState();
}

class _StandingViewState extends State<StandingView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LivescoreText(text: 'Standings Screen'),
    );
  }
}
