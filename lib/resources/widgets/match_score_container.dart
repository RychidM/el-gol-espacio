import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:livescore/resources/widgets/teams_container.dart';

import '../app_colors.dart';
import '../app_dimens.dart';
import '../app_font.dart';

class MatchScoreContainer extends StatelessWidget {
  final String? matchHalf;
  final String? homeTeamName;
  final String? awayTeamName;
  final String homeTeamCrest;
  final String awayTeamCrest;
  final String? homeTeamScore;
  final String? awayTeamScore;
  final double? padding;
  const MatchScoreContainer({
    required this.matchHalf,
    required this.homeTeamName,
    required this.awayTeamName,
    required this.homeTeamCrest,
    required this.awayTeamCrest,
    required this.homeTeamScore,
    required this.awayTeamScore,
    this.padding,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: padding ?? AppDimens.lPadding20.h),
      height: AppDimens.lPadding70.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: AppColors.lGrey20,
        borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius),
      ),
      child: Stack(
        children: [
          Positioned(
            right: 0,
            child: Container(
              height: AppDimens.lPadding70.h,
              width: AppDimens.lPadding48.w,
              decoration: BoxDecoration(
                color: AppColors.lSecondaryColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(AppDimens.lAppBorderRadius),
                  bottomRight: Radius.circular(AppDimens.lAppBorderRadius),
                ),
              ),
              child: Center(
                child: LivescoreText(
                  text: matchHalf ?? 'HT',
                  fontSize: AppDimens.lTextFieldFont,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Align(
            alignment: const Alignment(-1, 0),
            child: SizedBox(
              width: AppDimens.lImageContainerDimens.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TeamsContainer(
                      homeTeam: homeTeamCrest, awayTeam: awayTeamCrest),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: AppDimens.lPadding70.w,
                        child: Center(
                          child: LivescoreText(
                            text: homeTeamName ?? 'Barca',
                            fontSize: AppDimens.lTextFieldFont,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Gap(5.h),
                      LivescoreText(
                        text: homeTeamScore ?? '2',
                        fontSize: AppDimens.lTextFieldFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      LivescoreText(
                        text: 'vs',
                        fontSize: AppDimens.lTextFieldFont,
                        fontWeight: FontWeight.w600,
                      ),
                      Gap(5.h),
                      LivescoreText(
                        text: '-',
                        fontSize: AppDimens.lTextFieldFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: AppDimens.lPadding70.w,
                        child: Center(
                          child: LivescoreText(
                            text: awayTeamName ?? 'Madrid',
                            fontSize: AppDimens.lTextFieldFont,
                            fontWeight: FontWeight.w600,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Gap(5.h),
                      LivescoreText(
                        text: awayTeamScore ?? '0',
                        fontSize: AppDimens.lTextFieldFont,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
