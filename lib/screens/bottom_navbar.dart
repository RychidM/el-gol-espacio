import 'package:flutter/material.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';

class LiveScoreBottomNavbar extends StatefulWidget {
  const LiveScoreBottomNavbar({super.key});

  @override
  State<LiveScoreBottomNavbar> createState() => _LiveScoreBottomNavbarState();
}

class _LiveScoreBottomNavbarState extends State<LiveScoreBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lPrimaryColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              color: AppColors.lSecondaryColor,
              child: BottomAppBar(
                color: Colors.transparent,
                elevation: 0,
                child: SizedBox(
                  height: AppDimens.lNavBarHeight,
                  child: Container(
                      // color: AppColors.lSecondaryColor,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
