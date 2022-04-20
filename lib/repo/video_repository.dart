import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:venteny/model/videos.dart';

import '../configs/config.dart';

class APIRequest {
  String baseUrl = Config.baseURL;

  Future<Videos> getVideos() async {
    final response = await http
        .get(Uri.parse(baseUrl + '/search?term=jack+johnson&entity=musicVideo'))
        .timeout(const Duration(seconds: 30));

    if (response.statusCode == 200) {
      Videos videos = Videos.fromJson(json.decode(response.body));
      return videos;
    } else {
      throw Exception(response.statusCode.toString());
    }
  }
}
