import 'dart:convert';

import 'package:cs_stream/controller/services/exceptions/youtube_exception.dart';
import 'package:cs_stream/model/youtube/class.dart';
import 'package:http/http.dart';

class YoutubeApiService {
  final Client client;

  YoutubeApiService({required this.client});

  Future<List<Results>> getYoutube(
      String query, String type, bool safeSearch) async {
    var list = query.split(' ');
    query = "";
    for (int i = 0; i < list.length; i++) {
      if (i != list.length - 1) {
        query += "${list[i]}%20";
      } else {
        query += list[i];
      }
    }
    final url = Uri.parse("https://simple-youtube-search.p.rapidapi.com/search"
        "?query=$query&type=$type&safesearch=True");

    final response = await client.get(
      url,
      headers: {
        'X-RapidAPI-Key': 'ef62cb7990msh454b3c50a0ea660p17d04cjsn0dedc0b170f6',
        'X-RapidAPI-Host': 'simple-youtube-search.p.rapidapi.com',
      },
    );

    try {
      if (response.statusCode >= 400) {
        throw Exception(response.reasonPhrase);
      }

      final responseBody = jsonDecode(response.body);
      if (responseBody == null) {
        throw YoutubeException('Cannot get youtube for $query');
      }

      List<Results> data = (jsonDecode(response.body)['results'] as List)
          .map((data) => Results.fromJson(data))
          .toList();

      return data;
    } catch (e) {
      rethrow;
    }
  }
}
