import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:livescore/generated/assets.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';
import 'package:livescore/resources/app_font.dart';
import 'package:livescore/resources/app_strings.dart';

import '../../resources/sample_data.dart';
import '../models.dart';

class MatchDetailsView extends StatefulWidget {
  final MatchScoreInfo matchInfo;
  const MatchDetailsView({super.key, required this.matchInfo});

  @override
  State<MatchDetailsView> createState() => _MatchDetailsViewState();
}

class _MatchDetailsViewState extends State<MatchDetailsView> {
  int _selected = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body,
    );
  }

  Widget get _body {
    return Stack(
      children: [
        Image.asset(Assets.imagesPatternBg),
        Column(
          children: [
            _appBarWidget(),
            _scorelineWidget(),
            Gap(AppDimens.lPadding30.h),
            _tabs,
            Gap(AppDimens.lPadding20.h),
            _lineUpWidget(),
            Gap(AppDimens.lPadding20.h),
            _chooseLineUPWidget()
          ],
        ),
      ],
    );
  }

  Padding _appBarWidget() {
    return Padding(
      padding: EdgeInsets.only(
          left: AppDimens.lPadding20.w,
          right: AppDimens.lPadding15.w,
          top: AppDimens.lPadding40.h),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              Assets.iconsArrowLeft,
              scale: 4,
            ),
          ),
          Gap(AppDimens.lPadding40.w),
          LivescoreText(text: widget.matchInfo.competition)
        ],
      ),
    );
  }

  Row _chooseLineUPWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius1),
            child: const LivescoreText(text: 'Choose Line Up')),
        Row(
          children: [
            Container(
                padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lOrange,
                ),
                child: LivescoreText(text: widget.matchInfo.homeTeam)),
            Gap(AppDimens.lPadding20.w),
            LivescoreText(text: widget.matchInfo.awayTeam),
          ],
        )
      ],
    );
  }

  Padding _lineUpWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
      child: SizedBox(
        height: 470.h,
        child: Image.asset(
          Assets.imagesLineup,
          width: double.maxFinite,
        ),
      ),
    );
  }

  Row get _tabs {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: tabNames
          .asMap()
          .entries
          .map((tabs) => InkWell(
                onTap: () {
                  setState(() {
                    _selected = tabs.key;
                  });
                },
                child: LivescoreText(
                  text: tabNames[tabs.key],
                  color: _selected == tabs.key
                      ? AppColors.lWhite
                      : AppColors.lGrey15,
                ),
              ))
          .toList(),
    );
  }

  Padding _scorelineWidget() {
    return Padding(
      padding: EdgeInsets.only(top: AppDimens.lPadding30.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding40.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Container(
                      height: AppDimens.lIconCircleSmallDimens,
                      width: AppDimens.lIconCircleSmallWidth,
                      padding: EdgeInsets.all(AppDimens.lPadding10.h),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lSecondaryColor.withOpacity(.5),
                          border:
                              Border.all(width: 1, color: AppColors.lGrey20)),
                      child: Image.asset(widget.matchInfo.homeTeamCrest),
                    ),
                    Gap(AppDimens.lPadding15.w),
                    LivescoreText(
                      text: widget.matchInfo.homeTeam,
                      fontSize: AppDimens.lTextFieldFont,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: AppDimens.lPadding80.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LivescoreText(
                            text: widget.matchInfo.homeTeamScore,
                            fontSize: AppDimens.lScoreLineText,
                          ),
                          LivescoreText(
                            text: '-',
                            fontSize: AppDimens.lScoreLineText,
                          ),
                          LivescoreText(
                            text: widget.matchInfo.awayTeamScore,
                            fontSize: AppDimens.lScoreLineText,
                          ),
                        ],
                      ),
                    ),
                    Gap(AppDimens.lPadding15.w),
                    LivescoreText(
                      text: widget.matchInfo.time,
                      fontSize: AppDimens.lTextFieldFont,
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: AppDimens.lIconCircleSmallDimens,
                      width: AppDimens.lIconCircleSmallWidth,
                      padding: EdgeInsets.all(AppDimens.lPadding10.h),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.lSecondaryColor.withOpacity(.5),
                          border:
                              Border.all(width: 1, color: AppColors.lGrey20)),
                      child: Image.asset(widget.matchInfo.awayTeamCrest),
                    ),
                    Gap(AppDimens.lPadding15.w),
                    LivescoreText(
                      text: widget.matchInfo.awayTeam,
                      fontSize: AppDimens.lTextFieldFont,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
