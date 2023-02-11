import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:livescore/bottom_navbar/bottom_navbar_outlet.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';
import 'package:livescore/resources/app_font.dart';
import 'package:livescore/resources/app_strings.dart';
import 'package:livescore/screens/walk_through_data.dart';

import '../resources/widgets/custom_btn.dart';

class WalkThroughScreen extends StatefulWidget {
  const WalkThroughScreen({super.key});

  @override
  State<WalkThroughScreen> createState() => _WalkThroughScreenState();
}

class _WalkThroughScreenState extends State<WalkThroughScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lPrimaryColor,
      body: _biuldBody(context),
    );
  }
}

Widget _biuldBody(BuildContext context) {
  return Stack(
    children: [
      Positioned(
        top: AppDimens.lNavBarHeight,
        left: AppDimens.lPadding30.w,
        right: AppDimens.lContainerWidthSmall,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LivescoreText(
              text: AppStrings.lWalkThroughHeaderMsg,
              fontSize: AppDimens.lHeading2,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(height: AppDimens.lIconsDimensSmall.h),
            LivescoreText(
              text: AppStrings.lWalkThroughSubMsg,
              fontSize: AppDimens.lSubTitle16,
              color: AppColors.lGrey10,
            ),
            SizedBox(height: AppDimens.lPadding48.h),
          ],
        ),
      ),
      Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: AppDimens.lIconSquareContainerHeight +
              AppDimens.lIconSquareContainerHeight +
              100,
          width: double.maxFinite,
          child: GridView.builder(
              padding: EdgeInsets.symmetric(vertical: AppDimens.lPadding50.h),
              itemCount: interests.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 30,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return _gridItems(index);
              }),
        ),
      ),
      _continueAndSkipBtn(context)
    ],
  );
}

Positioned _continueAndSkipBtn(BuildContext context) {
  return Positioned(
    bottom: AppDimens.lPadding30.h,
    left: AppDimens.lPadding15.w,
    right: AppDimens.lPadding15,
    child: Column(
      children: [
        CustomButton(
            height: 63.h,
            width: double.maxFinite,
            child: LivescoreText(
              text: AppStrings.lContinue,
              fontSize: AppDimens.lSubTitle16,
            ),
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) {
                  return navBarOutlet();
                },
              ));
            }),
        SizedBox(height: AppDimens.lPadding15.h),
        LivescoreText(
          text: AppStrings.lSkip,
          fontSize: AppDimens.lSubTitle16,
        )
      ],
    ),
  );
}

int? selectedIndex;
var selections = [];

bool isSelected(index, List selections) {
  if (selections.contains(index)) {
    return true;
  }
  return false;
}

Widget _gridItems(int index) {
  return GestureDetector(
    onTap: () {
      selectedIndex = index;
    },
    child: Column(
      children: [
        Container(
          height: AppDimens.lIconCircleDimens,
          width: AppDimens.lIconCircleDimens,
          decoration: BoxDecoration(
              color: !isSelected(index, selections)
                  ? AppColors.lSecondaryColor
                  : AppColors.lOrange,
              borderRadius: BorderRadius.circular(AppDimens.lIconCircleDimens)),
          child: Center(
            child: Image.asset(
              interests[index].imgUrl,
              scale: 4,
            ),
          ),
        ),
        SizedBox(height: AppDimens.lPadding15 - 10.h),
        LivescoreText(
          text: interests[index].name,
          fontSize: AppDimens.lSubTitle16,
        ),
      ],
    ),
  );
}
