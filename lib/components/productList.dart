import 'package:flutter/material.dart';
import 'package:animation/models/product.dart';
import 'package:animation/productDetails.dart';

class ProductList extends StatefulWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  _ProductListState createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  List<Widget> _productTiles = [];
  final GlobalKey _listKey = GlobalKey();
  final String description =
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries";

  @override
  void initState() {
    _addProducts();
    super.initState();
  }

  void _addProducts() {
    // get data from db
    List<Product> _products = [
      Product(
          id: 1,
          name: 'Product Name 1',
          image: 'p1.jpg',
          description: description,
          unit: '250 gm',
          price: 1200,
          salePrice: 1050,
          rating: 4.5,
          reviewCount: 12),
      Product(
          id: 2,
          name: 'Product Name 2',
          image: 'p2.jpg',
          description: description,
          unit: '250 gm',
          price: 1200,
          salePrice: 1050,
          rating: 4.5,
          reviewCount: 12),
      Product(
          id: 3,
          name: 'Product Name 3',
          image: 'p3.jpg',
          description: description,
          unit: '250 gm',
          price: 1200,
          salePrice: 1050,
          rating: 4.5,
          reviewCount: 12),
      Product(
          id: 4,
          name: 'Product Name 4',
          image: 'p4.jpg',
          description: description,
          unit: '250 gm',
          price: 1200,
          salePrice: 1050,
          rating: 4.5,
          reviewCount: 12),
      Product(
          id: 5,
          name: 'Product Name 5',
          image: 'p1.jpg',
          description: description,
          unit: '250 gm',
          price: 1200,
          salePrice: 1050,
          rating: 4.5,
          reviewCount: 12),
    ];

    //add all products into productTiles
    _products.forEach((Product product) {
      _productTiles.add(_buildTile(product));
    });
  }

  Widget _buildTile(Product product) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetails(product: product)));
      },
      contentPadding: EdgeInsets.all(25),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('${product.rating} nights',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue[300])),
          Text(product.name,
              style: TextStyle(fontSize: 20, color: Colors.grey[600])),
        ],
      ),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: Image.asset(
          'images/${product.image}',
          height: 50.0,
        ),
      ),
      trailing: Text('\$${product.price}'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemCount: _productTiles.length,
      itemBuilder: (BuildContext context, int index) {
        return _productTiles[index];
      },
    );
  }
}
