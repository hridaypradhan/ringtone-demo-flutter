import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: IncomingCallScreen(),
    );
  }
}

class IncomingCallScreen extends StatelessWidget {
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
                    onPressed: () {},
                    label: 'Decline',
                    icon: Icons.call_end,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: screenSize.width * 0.3,
                  ),
                  CallActionButton(
                    onPressed: () {},
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
