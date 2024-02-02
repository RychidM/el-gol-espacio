import 'package:flutter/material.dart';
import 'package:livescore/resources/app_strings.dart';
import 'package:livescore/screens/discory_page/discory_screen.dart';
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
const List<String> tabNames = ['Line Up', 'Statistics', 'H2H', 'Odds'];

const List<Widget> screens = [
  HomeScreen(),
  CompetionsView(),
  DiscoveryView(),
  StandingView(),
  ProfileView()
];

const List<MatchScoreInfo> laLigaMatches = [
  MatchScoreInfo(
      competition: 'La Liga',
      homeTeam: AppStrings.lBarca,
      awayTeam: AppStrings.lRealMadrid,
      homeTeamCrest: Assets.laLigaBarcelona,
      awayTeamCrest: Assets.laLigaRealmadrid,
      homeTeamScore: '4',
      awayTeamScore: '1',
      half: 'FT',
      time: '25:46'),
  MatchScoreInfo(
      competition: 'La Liga',
      homeTeam: AppStrings.lAtletico,
      awayTeam: AppStrings.lVillareal,
      homeTeamCrest: Assets.laLigaAtletico,
      awayTeamCrest: Assets.laLigaVillareal,
      homeTeamScore: '1',
      awayTeamScore: '1',
      half: 'HT',
      time: '30:59'),
  MatchScoreInfo(
      competition: 'La Liga',
      homeTeam: AppStrings.lValencia,
      awayTeam: AppStrings.lBetis,
      homeTeamCrest: Assets.laLigaValencia,
      awayTeamCrest: Assets.laLigaRealBetis,
      homeTeamScore: '0',
      awayTeamScore: '2',
      half: 'HT',
      time: '90:01'),
  MatchScoreInfo(
      competition: 'La Liga',
      homeTeam: AppStrings.lSevilla,
      awayTeam: AppStrings.lGranada,
      homeTeamCrest: Assets.laLigaSevilla,
      awayTeamCrest: Assets.laLigaGranada,
      homeTeamScore: '3',
      awayTeamScore: '3',
      half: 'FT',
      time: '01:55'),
  // MatchScoreInfo(
  // competition: 'La Liga',
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
      competition: 'Premier League',
      homeTeam: AppStrings.lArsenal,
      awayTeam: AppStrings.lManU,
      homeTeamCrest: Assets.premArsenal,
      awayTeamCrest: Assets.premManchester,
      homeTeamScore: '1',
      awayTeamScore: '0',
      half: 'FT',
      time: '15:17'),
  MatchScoreInfo(
      competition: 'Premier League',
      homeTeam: AppStrings.lManCity,
      awayTeam: AppStrings.lLPool,
      homeTeamCrest: Assets.premManCity,
      awayTeamCrest: Assets.premLpool,
      homeTeamScore: '5',
      awayTeamScore: '0',
      half: 'HT',
      time: '33:33'),
  MatchScoreInfo(
      competition: 'Premier League',
      homeTeam: AppStrings.lChelsea,
      awayTeam: AppStrings.lSpurs,
      homeTeamCrest: Assets.premChelsea,
      awayTeamCrest: Assets.premTottenham,
      homeTeamScore: '1',
      awayTeamScore: '2',
      half: 'FT',
      time: '45:01'),
];

 List<News> news = [
  News(headline: 'Xavi: We were robbed of late handball call vs Man Utd', story: 'Xavi criticised the decision to deny Barcelona a penalty in their Europa League game against Manchester United after a late handball shout. Xavi insisted that Barcelona should have been awarded a penalty late in the second half, claiming Fred handled the ball in the box. Despite extensive Barca protests, the referee waved the claim away, while VAR also upheld the decision. Barca and United shared the spoils in a thrilling contest at Camp Nou. Both teams had penalty shouts denied, with Marcus Rashford going down as he ran through on goal well before Fred\'s incident.', date: '16 Feb 2023', mgUrl: Assets.imagesBarcaNews, time: '21:22', source: 'goal.com'),
  News(headline: 'Man Utd put massive asking price on Marcus Rashford', story: 'Ten Hag on Rashford contract expiring in 2024: “Rashford’s new deal is a priority. We are working on it, in the background we\'re working hard. We have to keep Marcus, of course “First day we met, I told him: I want to see your smile!”.', date: '19 Feb 2023', mgUrl: Assets.imagesRashfordUtd, time: '17:00', source: 'Fabrizio Romano'),
  News(headline: 'Lionel Messi wins seven-goal thriller for PSG with spectacular free-kick in 95th minute', story: 'Lionel Messi rolled back the years with a spectacular last-gasp free-kick to secure three points for Paris Saint-Germain against Lille in Ligue 1. The Argentine converted a stunning free-kick from outside of the box as PSG came from behind - having led themselves 2-0 at one stage - in a seven-goal thriller against Lille at Parc des Princes.', date: '19 Feb 2023', mgUrl: Assets.imagesMessiNews, time: '14:10', source: 'Ritabrata Banerjee'),
  News(headline: 'Body of ex-Ghana international Christian Atsu being flown home', story: 'The body of Christian Atsu is being flown home to Ghana on Sunday, the country\'s foreign ministry has said. In a statement released on Sunday morning, the ministry confirmed that: "The Government of Ghana is making arrangements to receive the mortal remains of the late Christian Atsu, a former Black Stars player. The remains will be accompanied by his family and Ghana\'s Ambassador to Turkiye on a Turkish airlines flight and will arrive in Accra at 7:40pm, Sunday 19th February, 2023." Atsu\'s body was recovered on Saturday morning, 12 days after the building in which he lived in the southern city of Hatay collapsed in the devastating earthquake that hit Turkey and Syria on February 6 that has so far killed over 45,000 people in the region.', date: '19 Feb 2023', mgUrl: Assets.imagesAtsuNews, time: '14:10', source: 'Brendan Madden'),
  News(headline: 'Bizarre moment baguette is thrown at Real Madrid star Rodrygo & referee is forced to remove food from the field', story: 'Real Madrid’s La Liga clash with Osasuna made headlines for all kinds of reasons, with one bizarre incident seeing a baguette thrown onto the field. Play briefly came to a halt midway through the second half when a sandwich was tossed in the direction of Blancos star Rodrygo. The match referee, Munuera Montero, was alerted to the presence of pitch-invading food substance and duly removed it from the field.', date: '19 Feb 2023', mgUrl: Assets.imagesMadridNews, time: '11:39', source: 'Chris Burton'),
  News(headline: 'Erling Haaland is now worth €1 billion!', story: 'Erling Haaland\'s agent, Rafaela Pimenta, believes her star client could command a fee of €1 billion (£890m/\$1bn) in today\'s transfer market. Pimenta said: "Erling Haaland is worth €1 billion. That\'s not a guess, I\'m sure of it. They might say I\'m being ridiculous, that a club is not going to pay a billion, but his age, his quality, his progression and the way he behaves is why I talk about a billion. The future is unknown but it\'s coming.', date: '19 Feb 2023', mgUrl: Assets.imagesHsslsndNews, time: '13:39', source: 'Brendan Madden'),
  News(headline: 'Cristiano Ronaldo\'s \'huge f*ck up\' contributed to split with longtime agent Jorge Mendes', story: 'Cristiano Ronaldo\'s controversial interview before his Manchester United exit reportedly contributed to his split with longtime agent Jorge Mendes. Ronaldo ditched his agent ahead of his January move to Al-Nassr and a report in L\'Equipe says the relationship between the pair started to deteriorate because Mendes could not find a new club for him after he left Old Trafford. Ronaldo and Mendes parted ways in the wake of the infamous interview in which the 38-year-old criticised Manchester United and coach Erik ten Hag.', date: '18 Feb 2023', mgUrl: Assets.imagesRonaldoNews, time: '20:40', source: 'Peter McVitie'),
];
