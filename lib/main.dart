import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:vibration/vibration.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IncomingCallScreen(),
    );
  }
}

class IncomingCallScreen extends StatelessWidget {
  final assetsAudioPlayer = AssetsAudioPlayer();
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              bottom: screenSize.height * 0.3,
              child: Row(
                children: [
                  FloatingActionButton(
                    onPressed: () async {
                      if (await Vibration.hasVibrator()) {
                        Vibration.vibrate(
                          pattern: [1500, 1000, 1500, 1000, 1500, 1000],
                        );
                      }
                      FlutterRingtonePlayer.playRingtone();
                    },
                    child: Text('Default Ringtone'),
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      if (await Vibration.hasVibrator()) {
                        Vibration.vibrate(
                          pattern: [1500, 1000, 1500, 1000, 1500, 1000],
                        );
                      }
                      FlutterRingtonePlayer.playNotification(looping: true);
                    },
                    child: Text('Default Notif'),
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      if (await Vibration.hasVibrator()) {
                        Vibration.vibrate(
                          pattern: [1500, 1000, 1500, 1000, 1500, 1000],
                        );
                      }

                      assetsAudioPlayer.open(
                        Audio("lib/highhopes.mp3"),
                      );
                      assetsAudioPlayer.play();
                    },
                    child: Text('Custom Sound'),
                  ),
                ],
              ),
            ),
            Positioned(
              top: screenSize.height * 0.1,
              child: Column(
                children: [
                  Text(
                    'Virat Kohli',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Is Calling You',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: Text(
                '10',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 90.0,
                ),
              ),
            ),
            Positioned(
              bottom: screenSize.height * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CallActionButton(
                    onPressed: () {
                      FlutterRingtonePlayer.stop();
                      Vibration.cancel();
                      assetsAudioPlayer.stop();
                    },
                    label: 'Decline',
                    icon: Icons.call_end,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.3,
                  ),
                  CallActionButton(
                    onPressed: () {
                      FlutterRingtonePlayer.stop();
                      Vibration.cancel();
                      assetsAudioPlayer.stop();
                    },
                    label: 'Accept',
                    icon: Icons.call,
                    color: Colors.green,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CallActionButton extends StatelessWidget {
  final String label;
  final Color color;
  final IconData icon;
  final Function onPressed;

  const CallActionButton({
    @required this.label,
    @required this.color,
    @required this.icon,
    @required this.onPressed,
  });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          width: screenSize.width * 0.18,
          height: screenSize.width * 0.18,
          child: RawMaterialButton(
            shape: CircleBorder(),
            onPressed: onPressed,
            child: Icon(
              icon,
              color: Colors.white,
              size: screenSize.width * 0.09,
            ),
            fillColor: color,
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
