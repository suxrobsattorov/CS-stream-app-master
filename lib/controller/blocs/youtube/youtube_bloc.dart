import 'package:bloc/bloc.dart';
import 'package:cs_stream/model/youtube/class.dart';
import 'package:meta/meta.dart';

part 'youtube_event.dart';
part 'youtube_state.dart';

class YoutubeBloc extends Bloc<YoutubeEvent, YoutubeState> {
  YoutubeBloc() : super(YoutubeInitial()) {
    on<YoutubeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
