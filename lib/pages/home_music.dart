import 'package:flutter/material.dart';

class HomeMusic extends StatelessWidget {
  const HomeMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.green.shade800.withOpacity(0.8),
            Colors.green.shade200.withOpacity(0.8),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color.fromRGBO(0, 0, 0, 1),
          unselectedItemColor: Colors.green.shade200.withOpacity(0.8),
          selectedItemColor: Color.fromRGBO(0, 117, 102, 1),
          items: const [
              BottomNavigationBarItem(
              icon: Icon(Icons.home), 
              label: 'Home'
              ),
              BottomNavigationBarItem(
              icon: Icon(Icons.music_note), 
              label: 'Music'
              ),
               BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), 
              label: 'Playlist'
              ),
               BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), 
              label: 'Favourite'
              ),
               BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), 
              label: 'Profile'
              )
            ]),
        body: Container(),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_outlined),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/tone.png'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
