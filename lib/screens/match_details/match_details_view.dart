import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:livescore/generated/assets.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';
import 'package:livescore/resources/app_font.dart';
import 'package:livescore/resources/app_strings.dart';

import '../models.dart';

class MatchDetailsView extends StatefulWidget {
  final MatchScoreInfo matchInfo;
  const MatchDetailsView({super.key, required this.matchInfo});

  @override
  State<MatchDetailsView> createState() => _MatchDetailsViewState();
}

class _MatchDetailsViewState extends State<MatchDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Image.asset(Assets.iconsArrowLeft, scale: 4),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: LivescoreText(
            text: AppStrings.lEPL,
            fontSize: AppDimens.lSubTitle16,
            fontWeight: FontWeight.w600),
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.only(
            left: AppDimens.lPadding30.w,
            right: AppDimens.lPadding30.w,
            top: AppDimens.lPadding20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
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
                            color: AppColors.lSecondaryColor,
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
                            color: AppColors.lSecondaryColor,
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
      ),
    );
  }
}
