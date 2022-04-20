import 'package:rxdart/rxdart.dart';
import 'package:venteny/model/videos.dart';
import 'package:venteny/repo/video_repository.dart';

class VideosBloc {
  final _videosFetcher = PublishSubject<Videos>();

  final APIRequest _apiRequest = APIRequest();

  Stream<Videos> get videos => _videosFetcher.stream;

  getVideos() async {
    String error = "";
    _apiRequest.getVideos().timeout(const Duration(seconds: 30)).catchError((e) {
      error = e.toString();
      _videosFetcher.sink.addError(error);

      throw error; //or even the same error
    }).then((value) {
      _videosFetcher.sink.add(value);
    });
  }

  disposeNetwork() {
    _videosFetcher.close();
  }
}
