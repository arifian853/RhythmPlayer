import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythm_player/pages/home_music.dart';
import 'package:rhythm_player/pages/music_list.dart';
import 'package:rhythm_player/pages/playlist_page.dart';
import 'package:rhythm_player/pages/splash_screen.dart';

void main() {
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
          bodyColor: Color.fromRGBO(0, 117, 102, 1),
          displayColor: Color.fromRGBO(0, 117, 102, 1),
        )
      ),
      home: const SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => const HomeMusic()),
        GetPage(name: '/song', page: () => const MusicList()),
        GetPage(name: '/playlist', page: () => const PlaylistPage()),
      ],
    );
  }
}

