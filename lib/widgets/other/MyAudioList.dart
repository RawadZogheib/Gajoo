import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:gajoo/globals/globals.dart' as globals;
import 'package:gajoo/widgets/other/MyCustomScrollBehavior.dart';
import 'package:intl/intl.dart';

class MyAudioList extends StatelessWidget {
  List<List<dynamic>> audiosList;

  MyAudioList({
    required this.audiosList,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
        bottomLeft: Radius.circular(30),
        bottomRight: Radius.circular(30),
      ),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.8,
        width: 500,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: ScrollConfiguration(
          behavior: MyCustomScrollBehavior(),
          child: ListView.builder(
              itemCount: audiosList.length,
              controller: ScrollController(),
              itemBuilder: (BuildContext context, int index) {
                // print( coursesList[index][1]);
                // print(DateTime.parse(
                //     DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now().toUtc())));
                return MyAudioItem(
                  audioId: audiosList[index][0].toString(),
                  width: 400,
                  text: audiosList[index][1],
                  maxTime: audiosList[index][2],
                  date: audiosList[index][3],
                  onTap: () => audiosList[index][4](),
                );
              }),
        ),
      ),
    );
  }
}

class MyAudioItem extends StatefulWidget {
  String audioId;
  double width;
  String text;
  double maxTime;
  String date;
  var onTap;

  MyAudioItem({
    required this.audioId,
    required this.width,
    required this.text,
    required this.maxTime,
    required this.date,
    required this.onTap,
  });

  @override
  State<MyAudioItem> createState() => _MyAudioItemState();
}

class _MyAudioItemState extends State<MyAudioItem> {
  bool _isPlaying = false;
  final AudioPlayer _audioPlayer = AudioPlayer();
  Duration _duration = const Duration();
  Duration _position = const Duration();
  Color _activeColor = Colors.grey;
  Color _inactiveColor = Colors.grey.shade300;
  Color _thumbColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      child: Container(
        height: 90,
        width: widget.width,
        margin: const EdgeInsets.all(12.0),
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: globals.whiteBlue,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(22),
            bottomRight: Radius.circular(22),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        widget.text,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontSize: 19, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('yyyy-MM-dd HH:mm')
                            .format(
                              DateFormat('yyyy-MM-dd HH:mm')
                                  .parse(widget.date, true)
                                  .toLocal(),
                            )
                            .toString(),
                        textAlign: TextAlign.center,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
                  ),
                  MySlider(),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                _getAudio();
              },
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
                child: Container(
                  height: 35,
                  width: 100,
                  alignment: Alignment.center,
                  color: Colors.blue,
                  child: _isPlaying == false
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                            ),
                            Text(
                              'Play',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(
                              Icons.pause,
                              color: Colors.white,
                            ),
                            Text(
                              'Pause',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget MySlider() {
    return Slider.adaptive(
      min: 0.0,
      value: _position.inSeconds.toDouble(),
      max: widget.maxTime,
      //_duration.inSeconds.toDouble(),
      activeColor: _activeColor,
      inactiveColor: _inactiveColor,
      thumbColor: _thumbColor,
      onChanged: (double value) {
        // if (_isPlaying == true) {
          setState(() {
            _audioPlayer.seek(Duration(seconds: value.toInt()));
          });
        // }
      },
    );
  }

  _getAudio() async {
    if (_isPlaying) {
      // Stop
      await _audioPlayer.pause().then((value) {
        setState(() {
          _activeColor = Colors.grey;
          _inactiveColor = Colors.grey.shade300;
          _thumbColor = Colors.grey;
          _isPlaying = false;
        });
      });
      // if (res == 1) {
      //   setState(() {
      //     _activeColor = Colors.grey;
      //     _inactiveColor = Colors.grey.shade300;
      //     _thumbColor = Colors.grey;
      //     _isPlaying = false;
      //   });
      // }
    } else {
      // Play
      String _url = '${globals.audioIP}/Audios/audio${widget.audioId}.mp3';
      Source _source = UrlSource(_url);
      print(_url);

      await _audioPlayer.play(_source).then((value) {
        setState(() {
          _activeColor = Colors.blue;
          _inactiveColor = Colors.blue.shade100;
          _thumbColor = Colors.blue;
          _isPlaying = true;
        });
      });//isLocal: true
      // if (res == 1) {
      //   setState(() {
      //     _activeColor = Colors.blue;
      //     _inactiveColor = Colors.blue.shade100;
      //     _thumbColor = Colors.blue;
      //     _isPlaying = true;
      //   });
      // }

      _audioPlayer.onDurationChanged.listen((Duration thisDuration) {
        setState(() {
          _duration = thisDuration;
        });
      });

      _audioPlayer.onPositionChanged.listen((Duration thisPosition) {
        setState(() {
          _position = thisPosition;
          debugPrint(_position.toString());
          debugPrint(Duration(seconds: widget.maxTime.toInt()).toString());
        });
        if (_position >= Duration(seconds: widget.maxTime.toInt())) {
          _isPlaying = true;
          _getAudio();
        }
      });
    }
  }
}
