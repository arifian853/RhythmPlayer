import 'package:rhythm_player/models/song_model.dart';

class Playlist {
  final String title;
  final String description;
  final List<Song> songs;
  final String imageUrl;

  Playlist(
      {required this.title,
      required this.description,
      required this.songs,
      required this.imageUrl});

  static List<Playlist> playlists = [
    Playlist(
      title: 'Sad Songs',
      description: 'A list of sad songs',
      songs: Song.songs,
      imageUrl: 'assets/images/cover-sad.png',
    ),
    Playlist(
      title: 'Love Songs',
      description: 'A list of love songs',
      songs: Song.songs,
      imageUrl: 'assets/images/cover-love.png',
    ),
    Playlist(
      title: 'Motivational Songs',
      description: 'A list of motivational songs',
      songs: Song.songs,
      imageUrl: 'assets/images/cover-motivational.png',
    ),
    Playlist(
      title: 'Favourite Songs',
      description: 'A list of favourite songs',
      songs: Song.songs,
      imageUrl: 'assets/images/cover-fav.png',
    ),
  ];
}
