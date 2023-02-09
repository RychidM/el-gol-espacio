import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livescore/resources/app_dimens.dart';

import '../app_colors.dart';

class TeamsContainer extends StatelessWidget {
  final String homeTeam;
  final String awayTeam;
  const TeamsContainer({
    Key? key,
    required this.homeTeam,
    required this.awayTeam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDimens.lPadding60.h,
      width: AppDimens.lPadding100.w,
      child: Stack(
        children: [
          Positioned(
            top: AppDimens.lPadding10.h,
            left: AppDimens.lPadding48.w,
            child: Container(
              padding: EdgeInsets.all(AppDimens.lPadding10.h),
              height: AppDimens.lPadding40.h + 2.h,
              width: AppDimens.lPadding40.w + 2.w,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: AppColors.lSecondaryColor),
              child: Image.asset(
                awayTeam,
              ),
            ),
          ),
          Positioned(
            top: AppDimens.lPadding10 - 3.h,
            left: AppDimens.lPadding10 - 3.w,
            child: Container(
              padding: EdgeInsets.all(AppDimens.lPadding10.h),
              height: AppDimens.lPadding48.h,
              width: AppDimens.lPadding48.w,
              decoration: BoxDecoration(
                  border: Border.all(width: 3, color: AppColors.lGrey20),
                  shape: BoxShape.circle,
                  color: AppColors.lSecondaryColor),
              child: Image.asset(
                homeTeam,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
