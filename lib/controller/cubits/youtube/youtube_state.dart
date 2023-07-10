part of 'youtube_cubit.dart';

@immutable
abstract class YoutubeState {}

class YoutubeInitial extends YoutubeState {}

class YoutubeLoaded extends YoutubeState {
  final List<Results> autoGenerate;

  YoutubeLoaded(this.autoGenerate);
}

class YoutubeLoading extends YoutubeState {}

class YoutubeError extends YoutubeState {
  final String message;

  YoutubeError(this.message);
}
