import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  const Heart({Key? key}) : super(key: key);

  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation _sizeAnimation;
  bool isFav = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this,
    );
    _colorAnimation = ColorTween(begin: Colors.grey[400],end: Colors.red)
    .animate(_controller);

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem>[
        TweenSequenceItem(
            tween: Tween(begin: 30, end: 50),
            weight: 50
        ),
        TweenSequenceItem(
            tween: Tween(begin: 50, end: 30),
            weight: 50
        )
      ]
    ).animate(_controller);

    _controller.addListener(() {
    });

    _controller.addStatusListener((status) {
      if(status == AnimationStatus.dismissed){
        setState(() {
          isFav = false;
        });
      }
      if(status == AnimationStatus.completed){
        setState(() {
          isFav = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _){
        return IconButton(
            onPressed: () {
              _controller.reverse();
              isFav ? _controller.reverse(): _controller.forward();
            },
            icon: Icon(
              Icons.favorite,
              color: _colorAnimation.value,
              size: _sizeAnimation.value.toDouble(),
            ));
      },
    );
  }
}
