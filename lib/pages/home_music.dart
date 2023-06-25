import 'package:flutter/material.dart';

class HomeMusic extends StatelessWidget {
  const HomeMusic({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Color.fromRGBO(12, 12, 12, 0.6)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const _CustomAppBar(),
        bottomNavigationBar: const _CustomNavBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color.fromRGBO(36, 131, 21, 1),
                      hintText: 'Search now...',
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Colors.black12),
                      suffixIcon: const Icon(
                        Icons.search,
                        color: Colors.black12,
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: BorderSide.none),
                    ),
                  ),
                  Text(
                    'Last Playing',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }
}

class _CustomNavBar extends StatelessWidget {
  const _CustomNavBar();

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromRGBO(0, 0, 0, 1),
        unselectedItemColor: Colors.green.shade200.withOpacity(0.8),
        selectedItemColor: const Color.fromRGBO(0, 117, 102, 1),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: 'Music'),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: 'Playlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outline), label: 'Favourite'),
          BottomNavigationBarItem(
              icon: Icon(Icons.people_outline), label: 'Profile')
        ]);
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: const Icon(Icons.grid_view_outlined),
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 20),
          child: const CircleAvatar(
            backgroundImage: AssetImage('assets/images/tone.png'),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
