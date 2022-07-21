class SeriesEpisodeDetailsModel {
  final String airDate;
  final int episodeNum;
  final String name;
  final String overview;
  final String stillPath;
  final String runtime;
  final String voteAverage;
  final List<GuestStars> stars;
  SeriesEpisodeDetailsModel(
      {required this.airDate,
      required this.episodeNum,
      required this.name,
      required this.overview,
      required this.runtime,
      required this.stillPath,
      required this.stars,
      required this.voteAverage});
  factory SeriesEpisodeDetailsModel.fromJson(Map<String, dynamic> json) {
    return SeriesEpisodeDetailsModel(
        airDate: json['air_date'].toString(),
        episodeNum: json['episode_number'],
        name: json['name'].toString(),
        overview: json['overview'].toString(),
        runtime: json['runtime'].toString(),
        stillPath: json['still_path'],
        voteAverage: json['vote_average'].toString(),
        stars: List<GuestStars>.from(json["guest_stars"].map((x)=>GuestStars.fromJson(x)))
        );
  }
}

class GuestStars {
  int id;
  String name;
  String headShot;
  GuestStars({required this.id, required this.name, required this.headShot});
  factory GuestStars.fromJson(Map<String, dynamic> json) {
    return GuestStars(
        id: json["id"], name: json["original_name"], headShot: json["profile_path"]);
  }
}
