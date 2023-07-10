import 'package:cs_stream/controller/cubits/youtube/youtube_cubit.dart';
import 'package:cs_stream/controller/repositories/youtube_repository.dart';
import 'package:cs_stream/controller/services/http/youtube_api_service.dart';
import 'package:cs_stream/view/screens/home_screen.dart';
import 'package:cs_stream/view/screens/live_screen.dart';
import 'package:cs_stream/view/screens/play_screen.dart';
import 'package:cs_stream/view/screens/save_screen.dart';
import 'package:cs_stream/view/screens/search_screen.dart';
import 'package:cs_stream/view/screens/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => YoutubeRepository(
        youtubeApiService: YoutubeApiService(
          client: Client(),
        ),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => YoutubeCubit(
              youtubeRepository: context.read<YoutubeRepository>(),
            ),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'CS stream',
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
          ),
          home: const HomeScreen(),
          routes: {
            HomeScreen.routeName: (context) => const HomeScreen(),
            SearchScreen.routeName: (context) => const SearchScreen(),
            LiveScreen.routeName: (context) => const LiveScreen(),
            VideoScreen.routeName: (context) => const VideoScreen(),
            SaveScreen.routeName: (context) => const SaveScreen(),
            PlayScreen.routeName: (context) => PlayScreen(),
          },
        ),
      ),
    );
  }
}
