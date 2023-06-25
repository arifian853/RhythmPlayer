import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rhythm_player/pages/home_music.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeMusic()));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            color: Color.fromRGBO(36, 131, 21, 1),
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon(
              //   Icons.edit,
              //   size: 80,
              //   color: Colors.amber,
              // ),
              Image(
                image: AssetImage('assets/images/tone.png'),
              ),
              SizedBox(height: 20),
              Text(
                'RhythmPlayer Music Player',
                style: TextStyle(
                    fontStyle: FontStyle.normal,
                    color: Colors.white,
                    fontSize: 24),
              )
            ],
          )),
    );
  }
}
// child: Image.asset('assets/images/tone.png')