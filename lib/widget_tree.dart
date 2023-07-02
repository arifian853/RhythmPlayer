// import 'package:rhythm_player/auth.dart';
// import 'package:rhythm_player/pages/home_music.dart';
// import 'package:rhythm_player/pages/login_register_page.dart';
// import 'package:flutter/material.dart';

// class WidgetTree extends StatefulWidget {
//   const WidgetTree({super.key});

//   @override
//   State<WidgetTree> createState() => _WidgetTreeState();
// }

// class _WidgetTreeState extends State<WidgetTree> {
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: Auth().authStateChanges,
//       builder: (context, snapshot) {
//         if (snapshot.hasData) {
//           return const HomeMusic();
//         } else {
//           return const LoginPage();
//         }
//       },
//     );
//   }
// }
