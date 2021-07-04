import 'package:flutter/material.dart';

class AnimatedFAB extends StatefulWidget {
  const AnimatedFAB({Key? key}) : super(key: key);

  @override
  _AnimatedFABState createState() => _AnimatedFABState();
}

class _AnimatedFABState extends State<AnimatedFAB> with SingleTickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _animateIcon;
  late Animation _colorAnimation;
  Curve _curve = Curves.easeOut;

  @override
  void initState() {
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
        vsync: this,
    );
    _colorAnimation = ColorTween(begin: Colors.blue,end: Colors.red).animate(_controller);
    _animateIcon = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);

    _controller.addStatusListener((status) {
      print('status = $status');
    });

    _controller.addListener(() {
      setState(() {
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: _colorAnimation.value,
        onPressed: (){
          _controller.forward();
        },
        child: AnimatedIcon(
        icon: AnimatedIcons.pause_play,
      progress: _animateIcon,
    ),
    );
  }
}
