part of 'youtube_bloc.dart';

@immutable
abstract class YoutubeState {}

class YoutubeInitial extends YoutubeState {}

class YoutubeLoaded extends YoutubeState {
  final AutoGenerate autoGenerate;

  YoutubeLoaded(this.autoGenerate);
}

class YoutubeLoading extends YoutubeState {}

class YoutubeError extends YoutubeState {
  final String message;

  YoutubeError(this.message);
}
