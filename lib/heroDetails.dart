import 'package:animation/components/heart.dart';
import 'package:flutter/material.dart';

class MyHeroDetails extends StatelessWidget {
  final String photo;

  const MyHeroDetails({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //centerTitle: true,
        //title: const Text('Product Details Page'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.55,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                //height: MediaQuery.of(context).size.height * 0.55,
                child: Hero(
                  tag: photo,
                  child: Image.asset(
                    photo,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Product Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),),
                Text('1200 tk'),
                Heart(),
                // IconButton(
                //     onPressed: () {},
                //     icon: Icon(
                //       Icons.favorite,
                //       color: Colors.grey[400],
                //       size: 30,
                //     )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blueAccent, width: 1.0),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  style: TextStyle(color: Colors.indigo),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
