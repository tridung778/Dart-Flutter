import 'dart:async';

import 'package:just_audio/just_audio.dart';
import 'package:rxdart/rxdart.dart';

class DurationState {
  final Duration progress;
  final Duration buffered;
  final Duration? total;

  DurationState({required this.progress, required this.buffered, this.total});
}

class AudioPlayerManager {
  AudioPlayerManager._internal();

  static final AudioPlayerManager _instance = AudioPlayerManager._internal();

  factory AudioPlayerManager() {
    return _instance;
  }

  final player = AudioPlayer();
  Stream<DurationState>? durationStateStream;
  String songUrl = '';

  void init() {
    durationStateStream =
        Rx.combineLatest2<Duration, PlaybackEvent, DurationState>(
            player.positionStream,
            player.playbackEventStream,
            (position, playbackEvent) => DurationState(
                progress: position,
                buffered: playbackEvent.bufferedPosition,
                total: playbackEvent.duration));
    player.setUrl(songUrl);
  }

  void updateSongUrl(String url) {
    songUrl = url;
    init();
  }

  void dispose() {
    player.dispose();
  }
}
