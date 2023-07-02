import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:rhythm_player/auth.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  // final User? user = Auth().currentUser;

  // Future<void> signOut() async {
  //   await Auth().signOut();
  // }

  // Widget _userId() {
  //   return Text(user?.email ?? 'User Email');
  // }

  // Widget _signOutButton() {
  //   return ElevatedButton(
  //     onPressed: signOut,
  //     child: const Text('Logout'),
  //   );
  // }

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
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'Profile',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  // 'Your email : $_userId',
                  'Your email : example@email.com',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                ),
                // _signOutButton(),
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
        systemNavigationBarColor: Colors.black, // Navigation bar
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
        Container(
          margin: const EdgeInsets.only(right: 20, top: 20),
          child: const CircleAvatar(
              backgroundColor: Colors.green,
              child: Icon(Icons.person_outlined)),
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
