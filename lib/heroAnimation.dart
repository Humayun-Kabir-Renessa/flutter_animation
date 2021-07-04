import 'package:animation/components/productList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'heroDetails.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class MyHero extends StatelessWidget {
  MyHero({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Hero Animation Home"),
      ),
      body: ProductList(),
      floatingActionButton: FloatingActionButton(
        onPressed: (){

        },
        child: Icon(Icons.shopping_cart_outlined),
      ),
    );
  }
}

class SingleProduct extends StatelessWidget {
  final int index;
  const SingleProduct({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Hero(
        tag: 'images/p${index + 1}.jpg',
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHeroDetails(
                photo: 'images/p${index+1}.jpg',
                )));
            },
            child: Container(
                //color: Colors.grey,
                height: 120.0,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          //border: Border.all(),
                          //borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        child: Image.asset('images/p${index+1}.jpg'),
                      ),
                    ),
                    SizedBox(width: 15.0,),
                    Expanded(
                      flex: 2,
                      child: Container(
                        //color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Product Name", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.deepPurple),),

                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Icon(Icons.star,color: Colors.amber),
                                Icon(Icons.star,color: Colors.amber),
                                Icon(Icons.star,color: Colors.amber),
                                Icon(Icons.star_half,color: Colors.amber),
                                Text(" ( 10 reviews )")
                              ],
                            ),
                            Row(
                              children: [
                                Text("1500 tk", style: TextStyle(fontSize: 20.0, color: Colors.grey, decoration: TextDecoration.lineThrough),),
                                SizedBox(width: 10.0,),
                                Text("1200 tk", style: TextStyle(fontSize: 20.0, color: Colors.black),),
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ),
      ),
    );
  }
}

/*Widget _buildBottomNavigationBar() {
  return SizedBox(
    height: 55.0,
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      key: globalKeyBottomNavController,
      currentIndex: _selectedPage,
      fixedColor: appThemeColor,
      backgroundColor: tabBarBackgroundColor,
      items: [
        _buildItem(icon: Icons.view_list, title: 'Home'),
        _buildItem(icon: Icons.shop, title: 'My Order'),
        _buildItem(icon: Icons.local_offer, title: 'Offer'),
        _buildItem(icon: Icons.perm_identity, title: 'Profile'),
      ],
      onTap: _onSelectTab,
    ),
  );
}*/

class HeroAnimation extends StatelessWidget {
  Widget build(BuildContext context) {
    timeDilation = 1.0; // 1.0 means normal animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Basic Hero Animation'),
      ),
      body: Center(
        child: PhotoHero(
          photo: 'images/p1.jpg',
          width: 300.0,
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute<void>(builder: (BuildContext context) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Flippers Page'),
                ),
                body: Container(
                  // Set background to blue to emphasize that it's a new route.
                  color: Colors.lightBlueAccent,
                  padding: const EdgeInsets.all(16.0),
                  alignment: Alignment.topLeft,
                  child: PhotoHero(
                    photo: 'images/p1.jpg',
                    width: 100.0,
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
              );
            }));
          },
        ),
      ),
    );
  }
}

class PhotoHero extends StatelessWidget {
  const PhotoHero(
      {Key? key, required this.photo, required this.onTap, required this.width})
      : super(key: key);

  final String photo;
  final VoidCallback onTap;
  final double width;

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: photo,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.asset(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
