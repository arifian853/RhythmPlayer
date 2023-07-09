import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rhythm_player/models/playlist_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.playlist,
  });

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed('/playlist', arguments: playlist);
      },
      child: Container(
        margin: const EdgeInsets.only(left: 10.0),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage(playlist.imageUrl),
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
                          top: 10.0, left: 10.0, right: 10.0, bottom: 5.0),
                      child: Text(
                        playlist.title,
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
                        playlist.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: Colors.white,
                            ),
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
