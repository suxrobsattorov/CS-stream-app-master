import 'dart:math';

import 'package:cs_stream/controller/cubits/youtube/youtube_cubit.dart';
import 'package:cs_stream/model/args.dart';
import 'package:cs_stream/model/youtube/class.dart';
import 'package:cs_stream/util/util_functions.dart';
import 'package:cs_stream/view/screens/play_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class VideoList extends StatefulWidget {
  String query;

  VideoList({Key? key, required this.query}) : super(key: key);

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getYoutube('${widget.query} ${generateRandomString()}', 'video', true);
  }

  String generateRandomString() {
    final random = Random();
    const allChars =
        'AaBbCcDdlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1EeFfGgHhIiJjKkL0123456789';

    final randomString =
        List.generate(1, (index) => allChars[random.nextInt(allChars.length)])
            .join();
    return randomString; // return the generated string
  }

  void _getYoutube(String query, String type, bool safeSearch) {
    context.read<YoutubeCubit>().getYoutube(query, type, safeSearch);
  }

  @override
  Widget build(BuildContext context) {
    print('${widget.query} ${generateRandomString()}');
    var util = UtilFunctions();
    return BlocConsumer<YoutubeCubit, YoutubeState>(
      listener: (context, state) async {
        if (state is YoutubeError) {
          if (state.message.startsWith("type 'Null'")) {
            _getYoutube('${widget.query} ${generateRandomString()}', 'video', true);
            return;
          }
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Error'),
              content: Text(state.message),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        if (state is YoutubeInitial) {
          return const Center(
            child: Text('YOUTUBE'),
          );
        }
        if (state is YoutubeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is YoutubeLoaded) {
          final List<Results> results = state.autoGenerate;
          return Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(0),
              itemCount: results.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    children: [
                      Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                PlayScreen.routeName,
                                arguments:
                                    Args(results: results[index], index: index),
                              );
                            },
                            child: Container(
                              height: 200,
                              width: double.infinity,
                              color: Colors.black,
                              child: Image.network(
                                results[index].thumbnail.url,
                                fit: BoxFit.cover,
                                // color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              padding: const EdgeInsets.all(3),
                              decoration: BoxDecoration(
                                color: Colors.black87,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                results[index].durationFormatted,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ListTile(
                        leading: CircleAvatar(
                          backgroundColor: Colors.deepOrangeAccent,
                          backgroundImage: NetworkImage(
                            results[index].channel.icon,
                          ),
                        ),
                        title: Text(results[index].title.toString()),
                        subtitle: Text('${results[index].channel.name} • '
                            '${util.views(results[index].views, index)} • '
                            '${util.date(results[index].uploadedAt, index)}'),
                        trailing: Image.asset(
                          'assets/images/icons/options.png',
                          height: 25,
                          width: 25,
                          fit: BoxFit.cover,
                          // color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        }
        return Center(
          child: Container(
            child: const Text('youtube'),
          ),
        );
      },
    );
  }
}
