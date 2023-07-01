import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../models/playlist_model.dart';

class PlaylistPage extends StatefulWidget {
  const PlaylistPage({super.key});

  @override
  State<PlaylistPage> createState() => _PlaylistPage();
}

class _PlaylistPage extends State<PlaylistPage> {
  Playlist playlist = Get.arguments ?? Playlist.playlists[0];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const BoxDecoration(color: Color.fromRGBO(12, 12, 12, 0.6)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBarMusic(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Playlist',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold)),
                const SizedBox(
                  height: 20,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Image(
                    image: AssetImage(playlist.imageUrl),
                    height: 250,
                    width: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  playlist.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: playlist.musics.length,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                        Get.toNamed('/song', arguments: playlist.musics[index]);
                      },
                      child: Container(
                        height: 65,
                        margin: const EdgeInsets.only(
                            top: 5.0, bottom: 5.0, left: 10.0, right: 10.0),
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(221, 43, 42, 42),
                            borderRadius: BorderRadius.circular(10.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(15.0),
                                  child: Image(
                                    image: AssetImage(
                                        playlist.musics[index].posterUrl),
                                    height: 50,
                                    width: 50,
                                    fit: BoxFit.cover,
                                  )),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    playlist.musics[index].title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(playlist.musics[index].artist,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                            color: Colors.white,
                                          ))
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Text(
                                playlist.musics[index].length,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(color: Colors.white),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.toNamed(
                                  '/song',
                                  arguments: playlist.musics[index],
                                );
                              },
                              icon: const Icon(
                                Icons.play_circle,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _CustomAppBarMusic extends StatelessWidget
    implements PreferredSizeWidget {
  const _CustomAppBarMusic();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: const SystemUiOverlayStyle(
        systemNavigationBarColor:
            Color.fromRGBO(36, 131, 21, 1), // Navigation bar
        statusBarColor: Color.fromRGBO(36, 131, 21, 1),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 20),
        child: InkWell(
            onTap: () {
              Get.toNamed(
                '/home',
              );
            },
            child: const Icon(Icons.arrow_back_ios)),
      ),
      actions: [
        InkWell(
          onTap: () {
            Get.toNamed(
              '/profile',
            );
          },
          child: Container(
            margin: const EdgeInsets.only(right: 20, top: 20),
            child: const CircleAvatar(
                backgroundColor: Colors.green,
                child: Icon(Icons.person_outlined)),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
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
