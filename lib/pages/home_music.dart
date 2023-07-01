import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rhythm_player/models/music_play_model.dart';
import 'package:rhythm_player/models/song_model.dart';
import 'package:rhythm_player/widget/main_music_card.dart';
import 'package:rhythm_player/widget/song_card.dart';

class HomeMusic extends StatelessWidget {
  const HomeMusic({super.key});

  @override
  Widget build(BuildContext context) {
    List<Song> songs = Song.songs;
    List<Music> musics = Music.musics;
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(12, 12, 12, 0.6)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            const _DiscoverMusic(),
            const SizedBox(height: 20.0),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: songs.length,
                  itemBuilder: (context, index) {
                    return SongCard(song: songs[index]);
                  }),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Music',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: musics.length,
                  itemBuilder: ((context, index) {
                    return MainMusicCard(music: musics[index]);
                  }),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}

class _DiscoverMusic extends StatelessWidget {
  const _DiscoverMusic();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color.fromRGBO(36, 131, 21, 1),
                hintText: 'Search now...',
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Colors.white),
                suffixIcon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 20),
            child: Text(
              'Last Playing',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class _CustomNavBar extends StatefulWidget {
  const _CustomNavBar();

  @override
  State<_CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<_CustomNavBar> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // Navigator.pushNamed(context, '/page${index + 1}');
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home');
        break;
      case 1:
        Navigator.pushNamed(context, '/playlist_list');
        break;
      case 2:
        Navigator.pushNamed(context, '/favourite');
        break;
      case 3:
        Navigator.pushNamed(context, '/music');
        break;
      case 4:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(36, 131, 21, 1),
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: 'Playlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favourite'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped);
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.black, // Navigation bar
        statusBarColor: Color.fromRGBO(36, 131, 21, 1),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Padding(
        padding: EdgeInsets.only(top: 20, bottom: 20),
        child: Icon(Icons.grid_view_outlined),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: InkWell(
            onTap: () {
              Get.toNamed(
                '/profile',
              );
            },
            child: Container(
              margin: const EdgeInsets.only(
                right: 20,
                top: 20,
              ),
              child: const CircleAvatar(
                  backgroundColor: Colors.green,
                  child: Icon(Icons.person_outlined)),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
