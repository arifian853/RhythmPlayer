import 'package:rhythm_player/models/song_model.dart';

class Playlist {
  final String title;
  final List<Song> songs;
  final String imageUrl;

  Playlist({required this.title, required this.songs, required this.imageUrl});

  static List<Playlist> playlists = [
    Playlist(
      title: 'Sad Songs',
      songs: Song.songs,
      imageUrl: 'assets/images/MCR.png',
    ),
    Playlist(
      title: 'Love Songs',
      songs: Song.songs,
      imageUrl: 'assets/images/fixyou.jpg',
    ),
    Playlist(
      title: 'Motivational Songs',
      songs: Song.songs,
      imageUrl: 'assets/images/neckdeep.jpg',
    ),
  ];
}
