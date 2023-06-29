import 'package:flutter/material.dart';

class AnimatedCrossFadeExampleCode extends StatelessWidget {
  const AnimatedCrossFadeExampleCode({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Woolha.com Flutter Tutorial',
      home: _AnimatedCrossFadeExample(),
    );
  }
}

class _AnimatedCrossFadeExample extends StatefulWidget {
  @override
  _AnimatedCrossFadeExampleState createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<_AnimatedCrossFadeExample> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });
    });

    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        _crossFadeState = CrossFadeState.showFirst;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Woolha.com Flutter Tutorial'),
      ),
      body: Center(
        child: AnimatedCrossFade(
          crossFadeState: _crossFadeState,
          duration: const Duration(seconds: 2),
          reverseDuration: const Duration(seconds: 3),
          firstCurve: Curves.bounceInOut,
          secondCurve: Curves.easeInBack,
          firstChild: const Icon(Icons.text_rotate_up, size: 100),
          secondChild: const Icon(Icons.text_rotate_vertical, size: 200),
          layoutBuilder: (Widget topChild, Key topChildKey, Widget bottomChild, Key bottomChildKey) {
            return Stack(
              clipBehavior: Clip.hardEdge,
              children: <Widget>[
                Positioned(
                  key: bottomChildKey,
                  left: 100.0,
                  top: 100.0,
                  child: bottomChild,
                ),
                Positioned(
                  key: topChildKey,
                  child: topChild,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}