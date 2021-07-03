import 'package:flutter/material.dart'
;
class MyFadeTransition extends StatefulWidget {
  const MyFadeTransition({Key? key}) : super(key: key);

  @override
  _MyFadeTransitionState createState() => _MyFadeTransitionState();
}

class _MyFadeTransitionState extends State<MyFadeTransition> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.easeIn,
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
        title: Text('Fade Transition'),
      ),
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child:  Padding(padding: EdgeInsets.all(8),
              child: Image.asset('images/Renessa-Logo-10.png')),
        ),
      ),
    );
  }
}
