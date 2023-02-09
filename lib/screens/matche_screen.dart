import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../resources/app_font.dart';

class CompetionsView extends StatefulWidget {
  const CompetionsView({super.key});

  @override
  State<CompetionsView> createState() => _CompetionsViewState();
}

class _CompetionsViewState extends State<CompetionsView> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: LivescoreText(text: 'Matches Screen'),
    );
  }
}