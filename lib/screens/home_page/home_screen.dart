import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:livescore/generated/assets.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';
import 'package:livescore/resources/app_font.dart';
import 'package:livescore/resources/app_strings.dart';
import 'package:livescore/resources/sample_data.dart';
import 'package:livescore/screens/models.dart';
import 'package:livescore/screens/walk_through_data.dart';

import '../../resources/widgets/match_score_container.dart';
import '../match_details/match_details_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: _menuTitleWidget,
        toolbarHeight: AppDimens.lButtonHeight + 20,
        title: LivescoreText(
          text: AppStrings.lLiveScore,
          fontSize: AppDimens.lSubTitle1,
        ),
        actions: [
          _actionButtons,
        ],
        elevation: 0,
      ),
      backgroundColor: AppColors.lPrimaryColor,
      body: Stack(
        children: [
          Image.asset(Assets.imagesPatternBg, color: Colors.red),
          SingleChildScrollView(
            child: Column(
              children: [
                _latestNewsBanner(),
                Gap(AppDimens.lPadding20.h),
                Padding(
                  padding: EdgeInsets.only(left: AppDimens.lPadding20.w),
                  child: SizedBox(
                    height: 45.h,
                    child: ListView.builder(
                        itemCount: top5Leagues.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return _interestContainer(index);
                        }),
                  ),
                ),
                Gap(AppDimens.lPadding20.h),
                _leagueResultsTitle(),
                Gap(AppDimens.lPadding20.h),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
                  child: Column(
                    children: laLigaMatches
                        .map((l) => GestureDetector(
                              onTap: () =>
                                  _navigateToMatchDetailsView(context, l),
                              child: MatchScoreContainer(
                                homeTeamCrest: l.homeTeamCrest,
                                awayTeamCrest: l.awayTeamCrest,
                                homeTeamName: l.homeTeam,
                                awayTeamName: l.awayTeam,
                                homeTeamScore: l.homeTeamScore,
                                awayTeamScore: l.awayTeamScore,
                                matchHalf: l.half,
                              ),
                            ))
                        .toList(),
                  ),
                ),
                // _leagueResultsTitle(
                //     flag: Assets.imagesEngland,
                //     country: AppStrings.lEngland,
                //     league: AppStrings.lEPL),
                // Gap(AppDimens.lPadding20.h),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
                //   child: Column(
                //     children: premMatches
                //         .map((l) => GestureDetector(
                //               onTap: () => _navigateToMatchDetailsView(context, l),
                //               child: MatchScoreContainer(
                //                 homeTeamCrest: l.homeTeamCrest,
                //                 awayTeamCrest: l.awayTeamCrest,
                //                 homeTeamName: l.homeTeam,
                //                 awayTeamName: l.awayTeam,
                //                 homeTeamScore: l.homeTeamScore,
                //                 awayTeamScore: l.awayTeamScore,
                //                 matchHalf: l.half,
                //               ),
                //             ))
                //         .toList(),
                //   ),
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding _leagueResultsTitle({String? flag, String? league, String? country}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: AppDimens.lPadding125.w + AppDimens.lPadding20.w,
            child: Row(
              children: [
                Image.asset(
                  flag ?? Assets.imagesLaliga,
                  height: 20.h,
                  scale: 4.5,
                ),
                Gap(AppDimens.lPadding10.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LivescoreText(
                      text: league ?? AppStrings.lLaLiga,
                      fontSize: AppDimens.lSubTitle16,
                      fontWeight: FontWeight.w500,
                    ),
                    LivescoreText(
                      text: country ?? AppStrings.lSpain,
                      fontSize: AppDimens.lTextFieldFont1,
                      color: AppColors.lGrey10,
                    )
                  ],
                )
              ],
            ),
          ),
          Image.asset(
            Assets.iconsArrowRight,
            scale: 5,
          )
        ],
      ),
    );
  }

  Padding _latestNewsBanner() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
      child: Container(
        height: AppDimens.lImageContainerDimens161.h,
        width: double.maxFinite,
        decoration: BoxDecoration(
            gradient: AppColors.lGradientBlue,
            borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius)),
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
                    padding:
                        EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.h),
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(AppDimens.lPadding100.r),
                      color: AppColors.lWhite,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SizedBox(width: 3.w),
                        Image.asset(Assets.imagesFootball, scale: 15),
                        SizedBox(width: 5.w),
                        LivescoreText(
                          text: AppStrings.lFootball,
                          fontSize: AppDimens.lTextFieldFont,
                          fontWeight: FontWeight.w600,
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
              bottom: 0,
              right: 0,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(AppDimens.lAppBorderRadius)),
                child: Image.asset(
                  Assets.imagesHenderson,
                  height: 177.h,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Padding get _actionButtons {
    return Padding(
      padding: EdgeInsets.only(right: AppDimens.lPadding20.w + 5.w),
      child: Row(
        children: [
          Image.asset(
            Assets.iconsSearch,
            scale: 3,
            color: AppColors.lWhite,
          ),
          SizedBox(width: AppDimens.lPadding20.w),
          Image.asset(Assets.iconsNotification, scale: 4),
        ],
      ),
    );
  }

  Padding get _menuTitleWidget {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.lPadding20.w + 5.w),
      child: GestureDetector(
          onTap: () {},
          child: Image.asset(
            Assets.imagesFootball,
            scale: 9,
          )),
    );
  }

  GestureDetector _interestContainer(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            vertical: AppDimens.lPadding10.h,
            horizontal: AppDimens.lPadding10.w),
        margin: EdgeInsets.only(right: AppDimens.lPadding20.w),
        // height: 30.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius),
          color: _selectedIndex != index
              ? AppColors.lSecondaryColor
              : AppColors.lOrange,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              top5Leagues[index].imgUrl,
              scale: 5.5,
            ),
            Gap(AppDimens.lPadding10.h),
            LivescoreText(
              text: top5Leagues[index].name,
              fontSize: AppDimens.lTextFieldFont,
            )
          ],
        ),
      ),
    );
  }
}

void _navigateToMatchDetailsView(
    BuildContext context, MatchScoreInfo matchInfo) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MatchDetailsView(matchInfo: matchInfo)));
}
