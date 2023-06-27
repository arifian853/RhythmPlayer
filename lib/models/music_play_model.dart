import 'package:rhythm_player/models/song_model.dart';

class Music {
  final String title;
  final String artist;
  final String length;
  final List<Song> songs;
  final String posterUrl;

  Music({
    required this.title,
    required this.songs,
    required this.posterUrl,
    required this.artist,
    required this.length,
  });

  static List<Music> musics = [
    Music(
      title: 'Famous Last Words',
      artist: 'My Chemical Romance',
      length: '5.01',
      songs: Song.songs,
      posterUrl: 'assets/images/MCR.png',
    ),
    Music(
      title: 'Never Gonna Give You Up',
      artist: 'Rick Astley',
      length: '3.33',
      songs: Song.songs,
      posterUrl: 'assets/images/rickastley.jpg',
    ),
    Music(
      title: 'Fix You',
      artist: 'Coldplay',
      length: '4.56',
      songs: Song.songs,
      posterUrl: 'assets/images/fixyou.jpg',
    ),
    Music(
      title: 'December',
      artist: 'Neck Deep',
      length: '3.39',
      songs: Song.songs,
      posterUrl: 'assets/images/neckdeep.jpg',
    ),
    Music(
      title: 'Havana',
      artist: 'Camilla Cabello',
      length: '3.39',
      songs: Song.songs,
      posterUrl: 'assets/images/havana.png',
    ),
    Music(
      title: 'In The End',
      artist: 'Linkin Park',
      length: '3.39',
      songs: Song.songs,
      posterUrl: 'assets/images/intheend.jpg',
    ),
    Music(
      title: 'Dont Blame Me',
      artist: 'Taylor Swift',
      length: '3.57',
      songs: Song.songs,
      posterUrl: 'assets/images/taylorswift.jpg',
    ),
  ];
}
