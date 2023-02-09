class Interests {
  final String name;
  final String imgUrl;

  const Interests({
    required this.name,
    required this.imgUrl,
  });
}

class MatchScoreInfo {
  final String homeTeam;
  final String awayTeam;
  final String homeTeamCrest;
  final String awayTeamCrest;
  final String homeTeamScore;
  final String awayTeamScore;
  final String half;
  final String time;

  const MatchScoreInfo(
      {required this.homeTeam,
      required this.awayTeam,
      required this.homeTeamCrest,
      required this.awayTeamCrest,
      required this.homeTeamScore,
      required this.awayTeamScore,
      required this.half, required this.time});
}
