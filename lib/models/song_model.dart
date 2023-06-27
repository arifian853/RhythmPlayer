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
      coverUrl: 'assets/images/MCR.png',
    ),
    Song(
      title: 'Never Gonna Give You Up',
      artist: 'Rick Astley',
      description: 'Lorem ipsum dolor sit amet...',
      url: 'assets/music/rickastley.mp3',
      coverUrl: 'assets/images/rickastley.jpg',
    ),
    Song(
      title: 'Fix You',
      artist: 'Coldplay',
      description: 'Lorem ipsum dolor sit amet...',
      url: 'assets/music/fixyou.mp3',
      coverUrl: 'assets/images/fixyou.jpg',
    ),
    Song(
      title: 'December',
      artist: 'Neck Deep',
      description: 'Lorem ipsum dolor sit amet...',
      url: 'assets/music/december.mp3',
      coverUrl: 'assets/images/neckdeep.jpg',
    ),
    Song(
      title: 'Havana',
      artist: 'Camilla Cabello',
      description: 'Lorem ipsum dolor sit amet...',
      url: 'assets/music/havana.mp3',
      coverUrl: 'assets/images/havana.png',
    ),
    Song(
      title: 'In The End',
      artist: 'Linkin Park',
      description: 'Lorem ipsum dolor sit amet...',
      url: 'assets/music/intheend.mp3',
      coverUrl: 'assets/images/intheend.jpg',
    ),
    Song(
      title: 'In The End',
      artist: 'Linkin Park',
      description: 'Lorem ipsum dolor sit amet...',
      url: 'assets/music/intheend.mp3',
      coverUrl: 'assets/images/intheend.jpg',
    ),
    Song(
      title: 'Dont Blame Me',
      artist: 'Taylor Swift',
      description: 'Lorem ipsum dolor sit amet...',
      url: 'assets/music/taylorswift.mp3',
      coverUrl: 'assets/images/taylorswift.jpg',
    ),
  ];
}
