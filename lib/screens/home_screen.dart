import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livescore/livescore_icons_icons.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';
import 'package:livescore/resources/app_font.dart';
import 'package:livescore/resources/app_strings.dart';
import 'package:livescore/screens/walk_through_data.dart';

import '../resources/widgets/teams_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: AppDimens.lPadding20.w,
                    vertical: AppDimens.lPadding48.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    LivescoreText(
                      text: AppStrings.lLiveScore,
                      fontSize: AppDimens.lSubTitle1,
                    ),
                    Row(
                      children: [
                        Image.asset(
                          "assets/icons/Search.png",
                          scale: 3,
                          color: AppColors.lWhite,
                        ),
                        SizedBox(width: AppDimens.lPadding20.w),
                        Image.asset("assets/icons/Notification.png", scale: 4),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
                child: Container(
                  height: AppDimens.lImageContainerDimens161.h,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      gradient: AppColors.lGradientBlue,
                      borderRadius:
                          BorderRadius.circular(AppDimens.lAppBorderRadius)),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Positioned(
                        top: AppDimens.lPadding15.h,
                        left: AppDimens.lPadding20.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: AppDimens.lPadding70.w + 5.w,
                              height: AppDimens.lPadding20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    AppDimens.lPadding100.r),
                                color: AppColors.lWhite,
                              ),
                              child: Row(
                                children: [
                                  SizedBox(width: 3.w),
                                  Image.asset("assets/images/football.png",
                                      scale: 15),
                                  SizedBox(width: 5.w),
                                  LivescoreText(
                                    text: AppStrings.lFootball,
                                    fontSize: AppDimens.lTextFieldFont,
                                    color: Colors.black,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: AppDimens.lPadding15.h),
                            SizedBox(
                              width: AppDimens.lPadding125.w + 50.w,
                              child: LivescoreText(
                                text: AppStrings.lLPoolUCL,
                                fontSize: AppDimens.lSubTitle18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: AppDimens.lPadding10.h),
                            LivescoreText(
                              text: AppStrings.lLPoolTime,
                              fontSize: AppDimens.lTextFieldFont1,
                            )
                          ],
                        ),
                      ),
                      Positioned(
                        top: -18,
                        right: 0,
                        child: Image.asset("assets/images/henderson.png",
                            scale: 4.15),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: AppDimens.lPadding20.h),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                      itemCount: interests.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return _interestContainer(index);
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _interestContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: AppDimens.lPadding20.h),
        margin: EdgeInsets.only(right: AppDimens.lPadding20.w),
        height: AppDimens.lIconSquareContainerHeight + 70.h,
        width: AppDimens.lIconSquareContainerWidth - 10.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius),
          color: AppColors.lSecondaryColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              interests[index].imgUrl,
              scale: 5.5,
            ),
            SizedBox(height: AppDimens.lPadding10.h),
            LivescoreText(
              text: interests[index].name,
              fontSize: AppDimens.lTextFieldFont,
            )
          ],
        ),
      ),
    );
  }
}
