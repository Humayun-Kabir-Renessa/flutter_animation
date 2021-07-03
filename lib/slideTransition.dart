import 'package:flutter/material.dart';

class MySlideTransition extends StatefulWidget {
  const MySlideTransition({Key? key}) : super(key: key);

  @override
  _MySlideTransitionState createState() => _MySlideTransitionState();
}

class _MySlideTransitionState extends State<MySlideTransition> with SingleTickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Slide Transition"),
    ),
    body: Center(
      child: SlideTransition(
          position: _offsetAnimation,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Image.asset('images/Renessa-Logo-10.png'),
          ),
        ),
    ),
    );
  }
}
