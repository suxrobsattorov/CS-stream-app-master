import 'package:cs_stream/model/args.dart';
import 'package:cs_stream/util/util_functions.dart';
import 'package:cs_stream/view/widgets/home/video_list.dart';
import 'package:cs_stream/view/widgets/navbar/main_navbar.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayScreen extends StatefulWidget {
  const PlayScreen({Key? key}) : super(key: key);

  static const routeName = '/play_screen';

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  late final YoutubePlayerController _controller;

  YoutubePlayer getVedio(String id) {
    _controller = YoutubePlayerController(
      initialVideoId: id,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: true,
      ),
    );
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
    );
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Args;
    var util = UtilFunctions();
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape
        ? Scaffold(body: getVedio(args.results.id))
        : Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Vedio tomosha'),
            ),
            body: Column(
              children: [
                getVedio(args.results.id),
                ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.deepOrangeAccent,
                    backgroundImage: NetworkImage(
                      args.results.channel.icon,
                    ),
                  ),
                  title: Text(args.results.title.toString()),
                  subtitle: Text('${args.results.channel.name} • '
                      '${util.views(args.results.views, args.index)} • '
                      '${util.date(args.results.uploadedAt, args.index)}'),
                  trailing: Image.asset(
                    'assets/images/icons/options.png',
                    height: 25,
                    width: 25,
                    fit: BoxFit.cover,
                    // color: Colors.white,
                  ),
                ),
                // VideoList(
                //   query: "CS GO",
                // ),
              ],
            ),
            bottomNavigationBar: const MainNavbar(),
          );
  }
}
