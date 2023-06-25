class Song {
  final String title;
  final String artist;
  final String description;
  final String url;
  final String coverUrl;

  Song(
      {required this.title,
      required this.artist,
      required this.description,
      required this.url,
      required this.coverUrl});
  static List<Song> songs = [
    Song(
        title: 'Famous Last Words',
        artist: 'My Chemical Romance',
        description: 'Lorem ipsum dolor sit amet...',
        url: 'assets/music/famouslastwords.mp3',
        coverUrl: 'assets/images/MCR.png'),
    Song(
        title: 'Fix You',
        artist: 'Coldplay',
        description: 'Lorem ipsum dolor sit amet...',
        url: 'assets/music/fixyou.mp3',
        coverUrl: 'assets/images/fixyou.jpg'),
    Song(
        title: 'December',
        artist: 'Neck Deep',
        description: 'Lorem ipsum dolor sit amet...',
        url: 'assets/music/december.mp3',
        coverUrl: 'assets/images/neckdeep.png'),
  ];
}
