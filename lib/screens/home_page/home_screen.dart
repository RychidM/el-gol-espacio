
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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  var _selectedIndex = 0;
  bool isMenuClosed = true;

  // Animation controllers
  late AnimationController _animationController;
  late Animation<double> animation;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 200))
      ..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
    scaleAnimation = Tween<double>(begin: 1, end: .8).animate(
      CurvedAnimation(
          parent: _animationController, curve: Curves.fastOutSlowIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 200),
          curve: Curves.fastOutSlowIn,
          left: isMenuClosed ? -AppDimens.lSideMenuWidth : 0,
          width: AppDimens.lSideMenuWidth,
          height: MediaQuery.of(context).size.height,
          child: Container(
            height: double.maxFinite,
            width: AppDimens.lSideMenuWidth,
            // color: AppColors.lBlue,
            child: Padding(
              padding: const EdgeInsets.all(50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    List.generate(5, (index) => LivescoreText(text: 'League')),
              ),
            ),
          ),
        ),
        //
        // Transform(
        //   transform: Matrix4.identity()
        //     ..setEntry(3, 2, 0.001)
        //     ..rotateY(animation.value - 30 * animation.value * pi / 120),
        //   child:
        Transform.translate(
          offset: Offset(animation.value * 200.w, 0),
          child: Transform.scale(
            scale: scaleAnimation.value,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(!isMenuClosed ? 20 : 0),
              child: _mainBody(),
            ),
          ),
        ),
        // ),
      ],
    );
  }

  Scaffold _mainBody() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: _menuTitleWidget,
        toolbarHeight: AppDimens.lButtonHeight + 20,
        title: LivescoreText(
          text: AppStrings.lqueGolazo,
          fontSize: AppDimens.lSubTitle1,
        ),
        actions: [
          _actionButtons,
        ],
        elevation: 0,
      ),
      // backgroundColor: AppColors.lPrimaryColor,
      body: _body,
    );
  }

  Widget get _body {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(AppDimens.lPadding20.h),
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
          _getCurrentTabMatchDetails(_selectedIndex),
        ],
      ),
    );
  }

  Widget _premMatches(BuildContext context) {
    return Column(
      children: [
        _leagueResultsTitle(
            flag: Assets.imagesPremWhite,
            country: AppStrings.lEngland,
            league: AppStrings.lEPL),
        Gap(AppDimens.lPadding20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
          child: Column(
            children: premMatches
                .asMap()
                .entries
                .map((l) => GestureDetector(
                      onTap: () =>
                          _navigateToMatchDetailsView(context, l.value),
                      child: MatchScoreContainer(
                        homeTeamCrest: l.value.homeTeamCrest,
                        awayTeamCrest: l.value.awayTeamCrest,
                        homeTeamName: l.value.homeTeam,
                        awayTeamName: l.value.awayTeam,
                        homeTeamScore: l.value.homeTeamScore,
                        awayTeamScore: l.value.awayTeamScore,
                        matchHalf: l.value.half,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _laLigaMatches(BuildContext context) {
    return Column(
      children: [
        _leagueResultsTitle(),
        Gap(AppDimens.lPadding20.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: AppDimens.lPadding20.w),
          child: Column(
            children: laLigaMatches
                .asMap()
                .entries
                .map((l) => GestureDetector(
                      onTap: () =>
                          _navigateToMatchDetailsView(context, l.value),
                      child: MatchScoreContainer(
                        homeTeamCrest: l.value.homeTeamCrest,
                        awayTeamCrest: l.value.awayTeamCrest,
                        homeTeamName: l.value.homeTeam,
                        awayTeamName: l.value.awayTeam,
                        homeTeamScore: l.value.homeTeamScore,
                        awayTeamScore: l.value.awayTeamScore,
                        matchHalf: l.value.half,
                      ),
                    ))
                .toList(),
          ),
        ),
      ],
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

  Widget get _actionButtons {
    return Image.asset(Assets.iconsNotification, scale: 4);
  }

  Padding get _menuTitleWidget {
    return Padding(
      padding: EdgeInsets.only(left: AppDimens.lPadding20.w + 5.w),
      child: GestureDetector(
          onTap: () {
            if (isMenuClosed) {
              _animationController.forward();
            } else {
              _animationController.reverse();
            }
            setState(() {
              isMenuClosed = !isMenuClosed;
            });
          },
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

  _getCurrentTabMatchDetails(int index) {
    dynamic currentTabMatch;

    Map<int, dynamic> views = {
      0: _laLigaMatches(context),
      1: _premMatches(context),
      2: _laLigaMatches(context),
      3: _premMatches(context),
      4: _laLigaMatches(context),
      5: _laLigaMatches(context),
    };
    currentTabMatch = views[index] ?? _laLigaMatches(context);
    return currentTabMatch;
  }
}

void _navigateToMatchDetailsView(
    BuildContext context, MatchScoreInfo matchInfo) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => MatchDetailsView(matchInfo: matchInfo)));
}
