import 'package:bloc/bloc.dart';
import 'package:cs_stream/controller/repositories/youtube_repository.dart';
import 'package:cs_stream/model/youtube/class.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'youtube_state.dart';

class YoutubeCubit extends Cubit<YoutubeState> {
  final YoutubeRepository youtubeRepository;

  YoutubeCubit({required this.youtubeRepository}) : super(YoutubeInitial());

  Future<void> getYoutube(String query, String type, bool safeSearch) async {
    emit(YoutubeLoading());
    try {
      final youtube =
          await youtubeRepository.getYoutube(query, type, safeSearch);
      emit(YoutubeLoaded(youtube));
    } catch (e) {
      emit(YoutubeError(e.toString()));
    }
  }
}
