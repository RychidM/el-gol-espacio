import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:livescore/livescore_icons_icons.dart';
import 'package:livescore/resources/app_colors.dart';
import 'package:livescore/resources/app_dimens.dart';
import 'package:livescore/resources/app_strings.dart';
import 'package:livescore/screens/walk_through.dart';

import '../resources/app_font.dart';
import '../resources/widgets/custom_btn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

bool value = false;

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.lPrimaryColor,
        body: _buildBody,
      ),
    );
  }

  Stack get _buildBody {
    return Stack(
      children: [
        _mbappeBg,
        _mbappe,
        _dotDecoration,
        _headerMsg,
        _subMsg,
        _signInSignUpButtons,
      ],
    );
  }

  Widget get _mbappeBg {
    return Positioned(
      top: AppDimens.lPadding125.h,
      left: AppDimens.lPadding48.w,
      right: AppDimens.lPadding48.w,
      child: Container(
        height: AppDimens.lImageContainerDimens.h,
        width: AppDimens.lImageContainerDimens.w,
        decoration: BoxDecoration(
            color: AppColors.lSecondaryColor,
            borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius1)),
      ),
    );
  }

  Widget get _mbappe {
    return Positioned(
      left: AppDimens.lPadding70.w,
      right: AppDimens.lPadding70.w,
      top: AppDimens.lPadding20.h,
      child: Image.asset("assets/images/mbappe.png",
          height: AppDimens.lImageDimens.h),
    );
  }

  Widget get _dotDecoration {
    return Positioned(
      left: AppDimens.lPadding50.w,
      right: AppDimens.lPadding30.w,
      top: AppDimens.lPadding20.h,
      child: Image.asset("assets/images/elipses.png",
          height: AppDimens.lImageDimens.h),
    );
  }

  Widget get _headerMsg {
    return Positioned(
      top: AppDimens.lImageDimens.h + 60.h,
      left: AppDimens.lPadding48.w,
      right: AppDimens.lPadding48.w,
      child: LivescoreText(
        text: AppStrings.lSplashScreenHeaderMsg,
        fontSize: AppDimens.lHeading1,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget get _subMsg {
    return Positioned(
      top: AppDimens.lPadding580.h,
      left: AppDimens.lPadding48.w,
      right: AppDimens.lPadding70.w + 5.w,
      child: LivescoreText(
        text: AppStrings.lSplashScreenSubMsg,
        fontSize: AppDimens.lSubTitle16,
        color: AppColors.lGrey10,
      ),
    );
  }

  Widget get _signInSignUpButtons {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: EdgeInsets.only(bottom: AppDimens.lPadding30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _signIn,
            SizedBox(width: AppDimens.lPadding30.w),
            _signUp,
          ],
        ),
      ),
    );
  }

  Widget get _signIn {
    return CustomButton(
      height: 63.h,
      width: AppDimens.lButtonWidth,
      onTap: () => _showSignInBottomModal(context),
      child: LivescoreText(
        text: AppStrings.lSignIn,
        fontSize: AppDimens.lSubTitle18,
        color: AppColors.lWhite,
      ),
    );
  }

  Widget get _signUp {
    return InkWell(
      onTap: (() {}),
      child: LivescoreText(
        text: AppStrings.lSignUp,
        color: AppColors.lGrey5,
        fontSize: AppDimens.lSubTitle18,
      ),
    );
  }
}

_showSignInBottomModal(BuildContext context) {
  showModalBottomSheet(
      backgroundColor: AppColors.lSecondaryColor,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppDimens.lAppBorderRadius1 - 10.r),
          topRight: Radius.circular(AppDimens.lAppBorderRadius1 - 10.r),
        ),
      ),
      context: context,
      builder: (_) {
        return Container(
          height: AppDimens.lBottomSheetHeight,
          padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
          child: Stack(
            children: [
              Align(
                child: Column(
                  children: [
                    SizedBox(height: AppDimens.lPadding20.h),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppDimens.lAppBorderRadius),
                        color: AppColors.lGrey15,
                      ),
                      height: 4.h,
                      width: AppDimens.lPadding70.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: AppDimens.lPadding15.h),
                        LivescoreText(
                          text: AppStrings.lWelcome,
                          fontSize: AppDimens.lScoreLineText + 2.sp,
                        ),
                        SizedBox(height: AppDimens.lPadding30.h),
                        _email,
                        SizedBox(height: AppDimens.lPadding20.h),
                        _password,
                        // SizedBox(height: AppDimens.lPadding20.h),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                    value: value,
                                    onChanged: (value) {},
                                    side: const BorderSide(
                                      color: AppColors.lGrey10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            AppDimens.lAppBorderRadius - 10.r)),
                                  ),
                                  SizedBox(height: AppDimens.lPadding15.h),
                                  LivescoreText(
                                    text: AppStrings.lRememberMe,
                                    fontSize: AppDimens.lTextFieldFont,
                                    color: AppColors.lGrey10,
                                  )
                                ],
                              ),
                              LivescoreText(
                                text: AppStrings.lForgotPassword,
                                fontSize: AppDimens.lTextFieldFont1,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              Positioned(
                  bottom: AppDimens.lPadding20.h,
                  left: AppDimens.lPadding15.w - 10.w,
                  right: AppDimens.lPadding15.w - 10.w,
                  child: Column(
                    children: [
                      CustomButton(
                        height: 63.h,
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const WalkThroughScreen()));
                        },
                        child: Center(
                          child: LivescoreText(
                            text: AppStrings.lSignIn,
                            fontSize: AppDimens.lSubTitle18,
                            color: AppColors.lWhite,
                          ),
                        ),
                      ),
                      SizedBox(height: AppDimens.lPadding20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          LivescoreText(
                            text: AppStrings.lDontHaveAnAcct,
                            fontSize: AppDimens.lTextFieldFont,
                            color: AppColors.lGrey10,
                          ),
                          LivescoreText(
                            text: AppStrings.lSignUp,
                            fontSize: AppDimens.lTextFieldFont,
                            color: AppColors.lBlue,
                          ),
                        ],
                      )
                    ],
                  ))
            ],
          ),
        );
      });
}

Widget get _email {
  return TextFormField(
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.lPrimaryColor,
      hintText: "Email",
      hintStyle: GoogleFonts.sourceSans3(
        fontSize: AppDimens.lTextFieldFont,
        color: AppColors.lGrey10,
      ),
      prefix: const Icon(
        LivescoreIcons.iconEmail,
        color: AppColors.lGrey10,
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius)),
      contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimens.lPadding15.w, vertical: AppDimens.lPadding15.h),
    ),
  );
}

Widget get _password {
  return TextFormField(
    obscureText: true,
    decoration: InputDecoration(
      filled: true,
      fillColor: AppColors.lPrimaryColor,
      hintText: "Password",
      hintStyle: GoogleFonts.sourceSans3(
        fontSize: AppDimens.lTextFieldFont,
        color: AppColors.lGrey10,
      ),
      prefix: const Icon(
        LivescoreIcons.iconEmail,
        color: AppColors.lGrey10,
      ),
      border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(AppDimens.lAppBorderRadius)),
      contentPadding: EdgeInsets.symmetric(
          horizontal: AppDimens.lPadding15.w, vertical: AppDimens.lPadding15.h),
    ),
  );
}
