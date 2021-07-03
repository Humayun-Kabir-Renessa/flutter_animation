import 'package:flutter/material.dart';

class MySizeTransition extends StatefulWidget {
  const MySizeTransition({Key? key}) : super(key: key);

  @override
  _MySizeTransitionState createState() => _MySizeTransitionState();
}

class _MySizeTransitionState extends State<MySizeTransition> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.fastOutSlowIn,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Size Transition"),
      ),
      body: SizeTransition(
        sizeFactor: _animation,
        axis: Axis.horizontal,
        axisAlignment: -1,
        child: Center(
          child: Image.asset('images/Renessa-Logo-10.png'),
        ),
      ),
    );
  }
}
