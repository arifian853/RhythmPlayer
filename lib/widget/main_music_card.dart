import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythm_player/models/music_play_model.dart';

class MainMusicCard extends StatelessWidget {
  const MainMusicCard({
    super.key,
    required this.music,
  });

  final Music music;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/song', arguments: music);
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
                  child: const Image(
                    image: AssetImage('assets/images/cover-default.png'),
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
                    music.title,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  Text(music.artist,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white,
                          ))
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.only(right: 8.0),
            //   child: Text(
            //     music.length,
            //     style: Theme.of(context)
            //         .textTheme
            //         .labelMedium!
            //         .copyWith(color: Colors.white),
            //   ),
            // ),
            IconButton(
              onPressed: () {
                Get.toNamed(
                  '/song',
                  arguments: music,
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
  }
}
