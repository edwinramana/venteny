import 'package:flutter/material.dart';
import 'package:venteny/bloc/bloc.dart';
import 'package:venteny/template_widgets/loaders/color_loader_5.dart';
import 'package:video_player/video_player.dart';

class VideoPreview extends StatefulWidget {
  const VideoPreview({Key? key}) : super(key: key);

  @override
  _VideoPreviewState createState() => _VideoPreviewState();
}

class _VideoPreviewState extends State<VideoPreview> with WidgetsBindingObserver {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    bloc.videoPreviewBloc.disposeNetwork();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.videoPreviewBloc.controller,
      builder: (context, AsyncSnapshot<VideoPlayerController> snapshot) {
        if (snapshot.hasError || snapshot.connectionState == ConnectionState.done) {
          return InkWell(
              child: const Center(child: Text("Error occured\n Please tap to retry!")),
              onTap: () => setState(() {
                    bloc.videoPreviewBloc.refreshVideo();
                  }));
        } else if (snapshot.hasData) {
          _controller = snapshot.data!;

          return Container(
            padding: const EdgeInsets.all(20),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                VideoPlayer(_controller),
                VideoProgressIndicator(_controller, allowScrubbing: true),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 50),
                  reverseDuration: const Duration(milliseconds: 200),
                  child: _controller.value.isPlaying
                      ? const SizedBox.shrink()
                      : Container(
                          color: Colors.black26,
                          child: const Center(
                            child: FractionallySizedBox(
                              heightFactor: 0.4,
                              widthFactor: 0.4,
                              child: FittedBox(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _controller.value.isPlaying ? _controller.pause() : _controller.play();
                    });
                  },
                ),
              ],
            ),
          );
        }
        return Container(alignment: Alignment.center, child: ColorLoader5());
      },
    );
  }
}
