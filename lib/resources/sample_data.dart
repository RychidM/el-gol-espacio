import 'package:flutter/material.dart';
import 'package:livescore/resources/app_strings.dart';
import 'package:livescore/screens/discory_screen.dart';
import 'package:livescore/screens/home_page/home_screen.dart';
import 'package:livescore/screens/models.dart';
import 'package:livescore/screens/profile_screen.dart';
import 'package:livescore/screens/standing_screen.dart';

import '../generated/assets.dart';
import '../screens/matche_screen.dart';

const List<String> menuIcons = [
  Assets.iconsHome,
  Assets.iconsCup,
  Assets.iconsDiscovery,
  Assets.iconsStandings,
  Assets.iconsProfile,
];

const List<String> menuNames = [
  'Home',
  'Matches',
  'Discover',
  'Standings',
  'Me'
];

const List<Widget> screens = [
  HomeScreen(),
  CompetionsView(),
  DiscoveryView(),
  StandingView(),
  ProfileView()
];

const List<MatchScoreInfo> laLigaMatches = [
  MatchScoreInfo(
      homeTeam: AppStrings.lBarca,
      awayTeam: AppStrings.lRealMadrid,
      homeTeamCrest: Assets.laLigaBarcelona,
      awayTeamCrest: Assets.laLigaRealmadrid,
      homeTeamScore: '4',
      awayTeamScore: '1',
      half: 'FT', time: '25:46'),
  MatchScoreInfo(
      homeTeam: AppStrings.lAtletico,
      awayTeam: AppStrings.lVillareal,
      homeTeamCrest: Assets.laLigaAtletico,
      awayTeamCrest: Assets.laLigaVillareal,
      homeTeamScore: '1',
      awayTeamScore: '1',
      half: 'HT', time: '30:59'),
  MatchScoreInfo(
      homeTeam: AppStrings.lValencia,
      awayTeam: AppStrings.lBetis,
      homeTeamCrest: Assets.laLigaValencia,
      awayTeamCrest: Assets.laLigaRealBetis,
      homeTeamScore: '0',
      awayTeamScore: '2',
      half: 'HT', time: '90:01'),
  MatchScoreInfo(
      homeTeam: AppStrings.lSevilla,
      awayTeam: AppStrings.lGranada,
      homeTeamCrest: Assets.laLigaSevilla,
      awayTeamCrest: Assets.laLigaGranada,
      homeTeamScore: '3',
      awayTeamScore: '3',
      half: 'FT', time: '01:55'),
  // MatchScoreInfo(
  //     homeTeam: AppStrings.lCelta,
  //     awayTeam: AppStrings.lSociedad,
  //     homeTeamCrest: Assets.laLigaCelta,
  //     awayTeamCrest: Assets.laLigaRealsocieded,
  //     homeTeamScore: '2',
  //     awayTeamScore: '0',
  //     half: 'FT', time: '15:17'),
];

const List<MatchScoreInfo> premMatches = [
  MatchScoreInfo(
      homeTeam: AppStrings.lArsenal,
      awayTeam: AppStrings.lManU,
      homeTeamCrest: Assets.premArsenal,
      awayTeamCrest: Assets.premManchester,
      homeTeamScore: '1',
      awayTeamScore: '0',
      half: 'FT', time: '15:17'),
  MatchScoreInfo(
      homeTeam: AppStrings.lManCity,
      awayTeam: AppStrings.lLPool,
      homeTeamCrest: Assets.premManCity,
      awayTeamCrest: Assets.premLpool,
      homeTeamScore: '5',
      awayTeamScore: '0',
      half: 'HT', time: '33:33'),
  MatchScoreInfo(
      homeTeam: AppStrings.lChelsea,
      awayTeam: AppStrings.lSpurs,
      homeTeamCrest: Assets.premChelsea,
      awayTeamCrest: Assets.premTottenham,
      homeTeamScore: '1',
      awayTeamScore: '2',
      half: 'FT', time: '45:01'),
];
