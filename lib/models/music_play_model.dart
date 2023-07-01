class Music {
  final String title;
  final String artist;
  final String length;
  final String posterUrl;
  final String url;

  Music({
    required this.title,
    required this.posterUrl,
    required this.artist,
    required this.length,
    required this.url,
  });

  static List<Music> musics = [
    Music(
      title: 'Famous Last Words',
      artist: 'My Chemical Romance',
      length: '5.01',
      posterUrl: 'assets/images/MCR.png',
      url: 'assets/music/famouslastwords.mp3',
    ),
    Music(
      title: 'Never Gonna Give You Up',
      artist: 'Rick Astley',
      length: '3.33',
      posterUrl: 'assets/images/rickastley.jpg',
      url: 'assets/music/rickastley.mp3',
    ),
    Music(
      title: 'Fix You',
      artist: 'Coldplay',
      length: '4.56',
      posterUrl: 'assets/images/fixyou.jpg',
      url: 'assets/music/fixyou.mp3',
    ),
    Music(
      title: 'December',
      artist: 'Neck Deep',
      length: '3.39',
      posterUrl: 'assets/images/neckdeep.jpg',
      url: 'assets/music/december.mp3',
    ),
    Music(
      title: 'Havana',
      artist: 'Camilla Cabello',
      length: '3.39',
      posterUrl: 'assets/images/havana.png',
      url: 'assets/music/havana.mp3',
    ),
    Music(
      title: 'In The End',
      artist: 'Linkin Park',
      length: '3.39',
      posterUrl: 'assets/images/intheend.jpg',
      url: 'assets/music/intheend.mp3',
    ),
    Music(
      title: 'Dont Blame Me',
      artist: 'Taylor Swift',
      length: '3.57',
      posterUrl: 'assets/images/taylorswift.jpg',
      url: 'assets/music/taylorswift.mp3',
    ),
  ];
}
