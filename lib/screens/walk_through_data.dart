import 'package:livescore/generated/assets.dart';
import 'package:livescore/resources/app_strings.dart';
import 'package:livescore/screens/models.dart';

List<Interests> interests = [
  const Interests(
      name: AppStrings.lFootball, imgUrl: "assets/images/football.png"),
  const Interests(
      name: AppStrings.lBasketball, imgUrl: "assets/images/basketball.png"),
  const Interests(
      name: AppStrings.lAFoottball,
      imgUrl: "assets/images/american_football.png"),
  const Interests(
      name: AppStrings.lBaseball, imgUrl: "assets/images/baseball.png"),
  const Interests(name: AppStrings.lTennis, imgUrl: "assets/images/tennis.png"),
  const Interests(name: AppStrings.lVolley, imgUrl: "assets/images/volly.png"),
];
List<Interests> top5Leagues = [
  const Interests(name: AppStrings.lLaLiga, imgUrl: Assets.imagesLaLigaWhite),
  const Interests(name: AppStrings.lEPL, imgUrl: Assets.imagesPremWhite),
  const Interests(
      name: AppStrings.lBundesLiga, imgUrl: Assets.imagesBundesligaWhite),
  const Interests(
      name: AppStrings.lLeague1, imgUrl: Assets.imagesLeagueOneWhite),
  const Interests(name: AppStrings.lSerieA, imgUrl: Assets.imagesSerieAWhite),
];
