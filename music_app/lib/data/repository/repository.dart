import '../model/song.dart';
import '../source/source.dart';

abstract interface class Repository {
  Future<List<Song>> getSongs();
}

class DefaultRepository implements Repository {
  final _localDataSource = LocalDataSource();
  final _remoteDataSource = RemoteDataSource();

  @override
  Future<List<Song>> getSongs() async {
    List<Song> songs = [];
    await _remoteDataSource.getSongs().then((remoteSongs) {
      if (remoteSongs == null) {
        _localDataSource.getSongs().then((localSongs) {
          if (localSongs != null) {
            songs.addAll(localSongs);
          }
        });
      } else {
        songs.addAll(remoteSongs);
      }
    });
    return songs;
  }
}
