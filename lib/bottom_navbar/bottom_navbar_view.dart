import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:livescore/bottom_navbar/bloc/bottom_navbar_state.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';
import 'package:livescore/resources/app_font.dart';
import 'package:livescore/resources/sample_data.dart';

import 'bloc/bottom_nav_bar_bloc.dart';
import 'bloc/bottom_navbar_event.dart';

class LiveScoreBottomNavbar extends StatefulWidget {
  const LiveScoreBottomNavbar({super.key});

  @override
  State<LiveScoreBottomNavbar> createState() => _LiveScoreBottomNavbarState();
}

class _LiveScoreBottomNavbarState extends State<LiveScoreBottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
        builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.lPrimaryColor,
        body: screens.elementAt(state.selectedIndex),
        bottomNavigationBar: BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
            builder: (context, state) {
          return SizedBox(
            height: AppDimens.lNavBarHeight,
            child: BottomNavigationBar(
                onTap: (value) => context
                    .read<BottomNavBarBloc>()
                    .add(BottomBarIconClicked(index: value)),
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                currentIndex: state.selectedIndex,
                backgroundColor: AppColors.lSecondaryColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: menuIcons.asMap().entries.map((icons) {
                  return BottomNavigationBarItem(
                      backgroundColor: AppColors.lSecondaryColor,
                      icon: state.selectedIndex != icons.key
                          ? Image.asset(
                              menuIcons[icons.key],
                              height: AppDimens.lPadding20.h,
                              width: AppDimens.lPadding20.w,
                            )
                          : Column(
                              children: [
                                LivescoreText(
                                  text: menuNames[icons.key],
                                  fontSize: 14.sp,
                                  color: AppColors.lBlue,
                                  fontWeight: FontWeight.w600,
                                ),
                                Gap(5.h),
                                Container(
                                  height: 5.h,
                                  width: 5.w,
                                  decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: AppColors.lBlue),
                                )
                              ],
                            ),
                      label: menuNames[icons.key]);
                }).toList()),
          );
        }),
      );
    });
  }
}
