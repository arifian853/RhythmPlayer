import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythm_player/pages/favourite_music.dart';
import 'package:rhythm_player/pages/home_music.dart';
import 'package:rhythm_player/pages/music_list.dart';
import 'package:rhythm_player/pages/playlist_list.dart';
import 'package:rhythm_player/pages/playlist_page.dart';
import 'package:rhythm_player/pages/profile.dart';
import 'package:rhythm_player/pages/song_page.dart';
import 'package:rhythm_player/pages/splash_screen.dart';
// import 'package:rhythm_player/widget_tree.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'RhythmPlayer Music App',
      theme: ThemeData(
          textTheme: Theme.of(context).textTheme.apply(
                bodyColor: const Color.fromRGBO(0, 0, 0, 1),
                displayColor: const Color.fromRGBO(0, 0, 0, 1),
              )),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => const SplashScreen()),
        GetPage(name: '/home', page: () => const HomeMusic()),
        GetPage(name: '/song', page: () => const SongPage()),
        GetPage(name: '/music', page: () => const MusicList()),
        GetPage(name: '/playlist_list', page: () => const PlaylistList()),
        GetPage(name: '/playlist', page: () => const PlaylistPage()),
        GetPage(name: '/favourite', page: () => const FavouritePage()),
        GetPage(name: '/profile', page: () => const ProfilePage()),
      ],
    );
  }
}
