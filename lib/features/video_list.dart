import 'package:flutter/material.dart';
import 'package:venteny/bloc/bloc.dart';
import 'package:venteny/model/videos.dart';
import 'package:venteny/template_widgets/loaders/color_loader_5.dart';

class VideosList extends StatefulWidget {
  const VideosList({Key? key}) : super(key: key);

  @override
  _VideosListState createState() => _VideosListState();
}

class _VideosListState extends State<VideosList> with WidgetsBindingObserver {
  Videos? _videos;
  bool _isFirst = true;

  @override
  void initState() {
    bloc.videosBloc.getVideos();
    super.initState();
  }

  @override
  void dispose() {
    bloc.videosBloc.disposeNetwork();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bloc.videosBloc.getVideos();

    return StreamBuilder(
      stream: bloc.videosBloc.videos,
      builder: (context, AsyncSnapshot<Videos> snapshot) {
        if (snapshot.hasError || snapshot.connectionState == ConnectionState.done) {
          return InkWell(
              child: const Center(child: Text("Error occured\n Please tap to retry!")),
              onTap: () => setState(() {
                    bloc.videosBloc.getVideos();
                  }));
        } else if (snapshot.hasData) {
          _videos = snapshot.data;
          if (_isFirst) {
            bloc.videoPreviewBloc.setupVideo(_videos!.results[0].previewUrl!);
            _isFirst = false;
          }

          return (_videos!.results.isEmpty)
              ? ListView(
                  children: const <Widget>[
                    Text(
                      "No data available",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                )
              : RefreshIndicator(
                  onRefresh: () {
                    return bloc.videosBloc.getVideos();
                  },
                  child: ListView.builder(
                      itemCount: _videos!.results.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: <Widget>[
                            InkWell(
                              child: ListTile(
                                leading: (_videos!.results[index].artworkUrl100 != null)
                                    ? AspectRatio(
                                        aspectRatio: 2 / 1,
                                        child: Container(
                                          color: Colors.black,
                                          child: Image.network(
                                            _videos!.results[index].artworkUrl100!,
                                            errorBuilder:
                                                (BuildContext context, Object exception, StackTrace? stacktrace) {
                                              return const SizedBox(width: 100, child: Center(child: Text("Error")));
                                            },
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      )
                                    : const SizedBox(width: 200, height: 200, child: Text("Error")),
                                title: Text(_videos!.results[index].trackName ?? ""),
                                subtitle: Text(_videos!.results[index].artistName ?? ""),
                              ),
                              onTap: () {
                                bloc.videoPreviewBloc.setupVideo(_videos!.results[index].previewUrl!);
                              },
                            ),
                            Divider()
                          ],
                        );
                      }),
                );
        }
        return Container(alignment: Alignment.center, child: ColorLoader5());
      },
    );
  }
}
