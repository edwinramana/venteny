// To parse this JSON data, do
//
//     final videos = videosFromJson(jsonString);

import 'dart:convert';

Videos videosFromJson(String str) => Videos.fromJson(json.decode(str));

String videosToJson(Videos data) => json.encode(data.toJson());

class Videos {
  Videos({
    required this.resultCount,
    required this.results,
  });

  int? resultCount;
  List<Result> results;

  factory Videos.fromJson(Map<String, dynamic> json) => Videos(
        resultCount: json["resultCount"] ?? 0,
        results: json["results"] == null ? [] : List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "resultCount": resultCount ?? 0,
        "results": results == null ? [] : List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Result {
  Result({
    this.wrapperType,
    this.kind,
    this.artistId,
    this.collectionId,
    this.trackId,
    this.artistName,
    this.collectionName,
    this.trackName,
    this.collectionCensoredName,
    this.trackCensoredName,
    this.artistViewUrl,
    this.collectionViewUrl,
    this.trackViewUrl,
    this.previewUrl,
    this.artworkUrl30,
    this.artworkUrl60,
    this.artworkUrl100,
    this.collectionPrice,
    this.trackPrice,
    this.releaseDate,
    this.collectionExplicitness,
    this.trackExplicitness,
    this.discCount,
    this.discNumber,
    this.trackCount,
    this.trackNumber,
    this.trackTimeMillis,
    this.country,
    this.currency,
    this.primaryGenreName,
  });

  String? wrapperType;
  String? kind;
  int? artistId;
  int? collectionId;
  int? trackId;
  String? artistName;
  String? collectionName;
  String? trackName;
  String? collectionCensoredName;
  String? trackCensoredName;
  String? artistViewUrl;
  String? collectionViewUrl;
  String? trackViewUrl;
  String? previewUrl;
  String? artworkUrl30;
  String? artworkUrl60;
  String? artworkUrl100;
  double? collectionPrice;
  double? trackPrice;
  DateTime? releaseDate;
  String? collectionExplicitness;
  String? trackExplicitness;
  int? discCount;
  int? discNumber;
  int? trackCount;
  int? trackNumber;
  int? trackTimeMillis;
  String? country;
  String? currency;
  String? primaryGenreName;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        wrapperType: json["wrapperType"] ?? null,
        kind: json["kind"] ?? null,
        artistId: json["artistId"] ?? null,
        collectionId: json["collectionId"] ?? null,
        trackId: json["trackId"] ?? null,
        artistName: json["artistName"] ?? null,
        collectionName: json["collectionName"] ?? null,
        trackName: json["trackName"] ?? null,
        collectionCensoredName: json["collectionCensoredName"] ?? null,
        trackCensoredName: json["trackCensoredName"] ?? null,
        artistViewUrl: json["artistViewUrl"] ?? null,
        collectionViewUrl: json["collectionViewUrl"] ?? null,
        trackViewUrl: json["trackViewUrl"] ?? null,
        previewUrl: json["previewUrl"] ?? null,
        artworkUrl30: json["artworkUrl30"] ?? null,
        artworkUrl60: json["artworkUrl60"] ?? null,
        artworkUrl100: json["artworkUrl100"] ?? null,
        collectionPrice: json["collectionPrice"] == null ? null : json["collectionPrice"].toDouble(),
        trackPrice: json["trackPrice"] == null ? null : json["trackPrice"].toDouble(),
        releaseDate: json["releaseDate"] == null ? null : DateTime.parse(json["releaseDate"]),
        collectionExplicitness: json["collectionExplicitness"] ?? null,
        trackExplicitness: json["trackExplicitness"] ?? null,
        discCount: json["discCount"] ?? null,
        discNumber: json["discNumber"] ?? null,
        trackCount: json["trackCount"] ?? null,
        trackNumber: json["trackNumber"] ?? null,
        trackTimeMillis: json["trackTimeMillis"] ?? null,
        country: json["country"] ?? null,
        currency: json["currency"] ?? null,
        primaryGenreName: json["primaryGenreName"] ?? null,
      );

  Map<String, dynamic> toJson() => {
        "wrapperType": wrapperType ?? null,
        "kind": kind ?? null,
        "artistId": artistId ?? null,
        "collectionId": collectionId ?? null,
        "trackId": trackId ?? null,
        "artistName": artistName ?? null,
        "collectionName": collectionName ?? null,
        "trackName": trackName ?? null,
        "collectionCensoredName": collectionCensoredName ?? null,
        "trackCensoredName": trackCensoredName ?? null,
        "artistViewUrl": artistViewUrl ?? null,
        "collectionViewUrl": collectionViewUrl ?? null,
        "trackViewUrl": trackViewUrl ?? null,
        "previewUrl": previewUrl ?? null,
        "artworkUrl30": artworkUrl30 ?? null,
        "artworkUrl60": artworkUrl60 ?? null,
        "artworkUrl100": artworkUrl100 ?? null,
        "collectionPrice": collectionPrice ?? null,
        "trackPrice": trackPrice ?? null,
        "releaseDate": releaseDate == null ? null : releaseDate!.toIso8601String(),
        "collectionExplicitness": collectionExplicitness ?? null,
        "trackExplicitness": trackExplicitness ?? null,
        "discCount": discCount ?? null,
        "discNumber": discNumber ?? null,
        "trackCount": trackCount ?? null,
        "trackNumber": trackNumber ?? null,
        "trackTimeMillis": trackTimeMillis ?? null,
        "country": country ?? null,
        "currency": currency ?? null,
        "primaryGenreName": primaryGenreName ?? null,
      };
}
