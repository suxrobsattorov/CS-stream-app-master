import 'package:cs_stream/controller/services/http/youtube_api_service.dart';
import 'package:cs_stream/model/youtube/class.dart';

class YoutubeRepository {
  final YoutubeApiService youtubeApiService;

  YoutubeRepository({required this.youtubeApiService});

  Future<List<Results>> getYoutube(
      String query, String type, bool safeSearch) async {
    return await youtubeApiService.getYoutube(query, type, safeSearch);
  }
}
