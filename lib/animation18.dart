import 'package:flutter/material.dart';

class Animation18 extends StatelessWidget {
  const Animation18({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: FadeInWidget(),
        ),
      ),
    );
  }
}

class FadeInWidget extends StatefulWidget {
  const FadeInWidget({Key? key}) : super(key: key);

  @override
  _FadeInWidgetState createState() => _FadeInWidgetState();
}

class _FadeInWidgetState extends State<FadeInWidget> {
  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(milliseconds: 500),
          child: Container(
            height: 100,
            width: 100,
            color: Colors.green,
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              _visible = !_visible;
            });
          },
          child: Text(_visible ? 'Hide' : 'Show'),
        ),
      ],
    );
  }
}