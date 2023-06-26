import 'package:flutter/material.dart';
import 'package:rhythm_player/models/song_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.song,
  });

  final Song song;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              image: DecorationImage(
                image: AssetImage(song.coverUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Container(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.45,
              decoration: BoxDecoration(
                color: Colors.black12.withOpacity(0.6),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        'Discover Weekly',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                      child: Text(
                        song.description,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
