import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class VideoPreviewBloc {
  VideoPlayerController? _controller;
  final _videosFetcher = PublishSubject<VideoPlayerController>();
  late String url;

  Stream<VideoPlayerController> get controller => _videosFetcher.stream;

   _initController()  {
    _controller = VideoPlayerController.network(
    url,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    _controller!.initialize();
    print("initContoller: "+_controller!.value.hasError.toString());

    _controller!.addListener(() {
      if (_controller!.value.hasError) {
        print("error2");
        _videosFetcher.sink.addError(_controller!.value.errorDescription!);
      }
    });
    _videosFetcher.sink.add(_controller!);
  }

  void setupVideo(String url) async {
    this.url = url;
    if (_controller == null) {
      _initController();
    } else {
      final oldController = _controller;
      await oldController!.dispose();
      _initController();
    }
  }

  void refreshVideo() async {
    if (_controller == null) {
      _initController();
    } else {
      final oldController = _controller;
      await oldController!.dispose();
      _initController();
    }
  }

  disposeNetwork() {
    _videosFetcher.close();
  }

}
