import 'dart:math';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../data/model/song.dart';
import 'audio_player_manager.dart';

class Playing extends StatelessWidget {
  const Playing({super.key, required this.songs, required this.playingSong});

  final Song playingSong;
  final List<Song> songs;

  @override
  Widget build(BuildContext context) {
    return PlayingPage(playingSong: playingSong, songs: songs);
  }
}

class PlayingPage extends StatefulWidget {
  const PlayingPage(
      {super.key, required this.songs, required this.playingSong});

  final Song playingSong;
  final List<Song> songs;

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _imageAnimationController;
  late AudioPlayerManager _audioPlayerManager;
  late int _selectedSongIndex;
  late Song _song;
  late double _currentAnimationPosition;
  bool _isShuffle = false;
  late LoopMode _loopMode;

  @override
  void initState() {
    super.initState();
    _song = widget.playingSong;
    _currentAnimationPosition = 0;
    _imageAnimationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 12));
    _audioPlayerManager = AudioPlayerManager();
    _audioPlayerManager.updateSongUrl(_song.source);
    _audioPlayerManager.init();
    _selectedSongIndex = widget.songs.indexOf(widget.playingSong);
    _loopMode = LoopMode.off;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    const delta = 64;
    final radius = (screenWidth - delta) / 2;

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: const Text('Now Playing'),
          trailing: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          )),
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _song.album,
              ),
              const SizedBox(height: 16),
              const Text('_ ___ _'),
              const SizedBox(height: 48),
              RotationTransition(
                turns: Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(_imageAnimationController),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(radius),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images.png',
                    image: _song.image,
                    width: screenWidth - delta,
                    height: screenWidth - delta,
                    imageErrorBuilder: (content, error, stackTrace) {
                      return Image.asset('assets/images.png',
                          width: screenWidth - delta,
                          height: screenWidth - delta);
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 64,
                  bottom: 16,
                ),
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.share)),
                      Column(
                        children: [
                          Text(
                            _song.title,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Text(
                            _song.artist,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .color,
                                ),
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.favorite)),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 32, left: 24, right: 24, bottom: 16),
                child: _progressBar(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 32, left: 24, right: 24, bottom: 16),
                child: _mediaButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _imageAnimationController.dispose();
    super.dispose();
  }

  Widget _mediaButtons() {
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          MediaButtonControl(
              function: _setShuffle,
              icon: Icons.shuffle,
              color: _getShuffleColor(),
              size: 24),
          MediaButtonControl(
              function: _setPrevSong,
              icon: Icons.skip_previous,
              color: Colors.greenAccent,
              size: 36),
          _playButton(),
          MediaButtonControl(
              function: _setNextSong,
              icon: Icons.skip_next,
              color: Colors.greenAccent,
              size: 36),
          MediaButtonControl(
              function: _setRepeat,
              icon: _repeatIcon(),
              color: _getRepeatColor(),
              size: 24),
        ],
      ),
    );
  }

  StreamBuilder<DurationState> _progressBar() {
    return StreamBuilder<DurationState>(
        stream: _audioPlayerManager.durationStateStream,
        builder: (context, snapshot) {
          final durationState = snapshot.data;
          final progress = durationState?.progress ?? Duration.zero;
          final buffered = durationState?.buffered ?? Duration.zero;
          final total = durationState?.total ?? Duration.zero;
          return ProgressBar(
            progress: progress,
            buffered: buffered,
            total: total,
            onSeek: _audioPlayerManager.player.seek,
            barHeight: 5.0,
            barCapShape: BarCapShape.round,
            thumbColor: Colors.greenAccent,
            progressBarColor: Colors.greenAccent,
          );
        });
  }

  StreamBuilder<PlayerState> _playButton() {
    return StreamBuilder(
        stream: _audioPlayerManager.player.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final progress = playerState?.processingState;
          final isPlaying = playerState?.playing;
          if (progress == ProcessingState.loading ||
              progress == ProcessingState.buffering) {
            return Container(
              margin: const EdgeInsets.all(8.0),
              width: 48,
              height: 48,
              child: const CircularProgressIndicator(),
            );
          } else if (isPlaying != true) {
            return MediaButtonControl(
              function: () {
                _audioPlayerManager.player.play();
                _imageAnimationController.forward(
                    from: _currentAnimationPosition);
                _imageAnimationController.repeat();
              },
              icon: Icons.play_arrow_sharp,
              color: Colors.greenAccent,
              size: 48,
            );
          } else if (progress != ProcessingState.completed) {
            return MediaButtonControl(
              function: () {
                _audioPlayerManager.player.pause();
                _imageAnimationController.stop();
                _currentAnimationPosition = _imageAnimationController.value;
              },
              icon: Icons.pause,
              color: Colors.greenAccent,
              size: 48,
            );
          } else {
            if (progress == ProcessingState.completed) {
              _imageAnimationController.stop();
              _currentAnimationPosition = 0.0;
            }
            return MediaButtonControl(
              function: () {
                _currentAnimationPosition = 0.0;
                _imageAnimationController.forward(
                    from: _currentAnimationPosition);
                _imageAnimationController.repeat();
                _audioPlayerManager.player.seek(Duration.zero);
              },
              icon: Icons.replay,
              color: Colors.greenAccent,
              size: 48,
            );
          }
        });
  }

  void _setShuffle() {
    setState(() {
      _isShuffle = !_isShuffle;
    });
  }

  Color _getShuffleColor() {
    return _isShuffle ? Colors.greenAccent : Colors.grey;
  }

  void _setRepeat() {
    if (_loopMode == LoopMode.off) {
      _loopMode = LoopMode.one;
    } else if (_loopMode == LoopMode.one) {
      _loopMode = LoopMode.all;
    } else {
      _loopMode = LoopMode.off;
    }
    setState(() {
      _audioPlayerManager.player.setLoopMode(_loopMode);
    });
  }

  void _setNextSong() {
    if (_isShuffle) {
      var random = Random();
      _selectedSongIndex = random.nextInt(widget.songs.length);
    } else if (_selectedSongIndex < widget.songs.length - 1) {
      ++_selectedSongIndex;
    } else if (_loopMode == LoopMode.all &&
        _selectedSongIndex == widget.songs.length - 1) {
      _selectedSongIndex = 0;
    }
    if (_selectedSongIndex >= widget.songs.length) {
      _selectedSongIndex = _selectedSongIndex % widget.songs.length;
    }
    final nextSong = widget.songs[_selectedSongIndex];
    _audioPlayerManager.updateSongUrl(nextSong.source);
    setState(() {
      _song = nextSong;
    });
  }

  void _setPrevSong() {
    if (_isShuffle) {
      var random = Random();
      _selectedSongIndex = random.nextInt(widget.songs.length);
    } else if (_selectedSongIndex > 0) {
      --_selectedSongIndex;
    } else if (_loopMode == LoopMode.all && _selectedSongIndex == 0) {
      _selectedSongIndex = widget.songs.length - 1;
    }
    if (_selectedSongIndex < 0) {
      _selectedSongIndex = (-1 * _selectedSongIndex) % widget.songs.length;
    }

    final prevSong = widget.songs[_selectedSongIndex];
    _audioPlayerManager.updateSongUrl(prevSong.source);
    setState(() {
      _song = prevSong;
    });
  }

  IconData _repeatIcon() {
    return switch (_loopMode) {
      LoopMode.one => Icons.repeat_one,
      LoopMode.all => Icons.repeat_on,
      _ => Icons.repeat,
    };
  }

  Color _getRepeatColor() {
    return _loopMode == LoopMode.off ? Colors.grey : Colors.greenAccent;
  }
}

class MediaButtonControl extends StatefulWidget {
  const MediaButtonControl(
      {super.key,
      required this.function,
      required this.icon,
      required this.color,
      required this.size});

  final void Function()? function;
  final IconData icon;
  final Color color;
  final double size;

  @override
  State<StatefulWidget> createState() => _MediaButtonControlState();
}

class _MediaButtonControlState extends State<MediaButtonControl> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: widget.function,
      icon: Icon(
        widget.icon,
      ),
      iconSize: widget.size,
      color: widget.color,
    );
  }
}
