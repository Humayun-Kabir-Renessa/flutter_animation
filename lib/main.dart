import 'package:animation/fadeTransition.dart';
import 'package:animation/heroAnimation.dart';
import 'package:animation/sizeTransition.dart';
import 'package:animation/slideTransition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Animation'),
      ),
      body: Column(
            children: [
              //Fade Transition
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyFadeTransition()));
                },
                child: Card(
                  elevation: 2.0,
                  color: Colors.indigo[100],
                  child: ListTile(
                    title: Text("Fade Transition"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),

              //Size Transition
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MySizeTransition()));
                },
                child: Card(
                  elevation: 2.0,
                  color: Colors.indigo[100],
                  child: ListTile(
                    title: Text("Size Transition"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),

              //Slide Transition
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MySlideTransition()));
                },
                child: Card(
                  elevation: 2.0,
                  color: Colors.indigo[100],
                  child: ListTile(
                    title: Text("Slide Transition"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
              //Hero Animation
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MyHero()));
                },
                child: Card(
                  elevation: 2.0,
                  color: Colors.indigo[100],
                  child: ListTile(
                    title: Text("Hero Animation"),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
              ),
            ],
          ),
    );
  }
}

