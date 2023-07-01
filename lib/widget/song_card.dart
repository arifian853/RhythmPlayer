import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythm_player/models/music_play_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
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
        margin: const EdgeInsets.only(left: 10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(music.posterUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              height: 65,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.6),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Text(
                        music.title,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 10.0,
                        left: 10.0,
                        right: 10.0,
                      ),
                      child: Text(
                        music.artist,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white, ),
                      ),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
