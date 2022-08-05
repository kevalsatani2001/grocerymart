import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocerymart/groceryinmodel.dart';

import 'modelcartlist2.dart';

class Cart_List extends StatefulWidget {
  const Cart_List({Key? key}) : super(key: key);
  @override
  State<Cart_List> createState() => _Cart_ListState();
}

class _Cart_ListState extends State<Cart_List> {
  num total = 0;
  num i = 0;
  var res;

  List<Product> allproducts = [
    Product(id: 1, name: "Apple", price: 50),
    Product(id: 2, name: "Mango", price: 70),
    Product(id: 3, name: "Orange", price: 40),
    Product(id: 4, name: "Pineapple", price: 50),
    Product(id: 5, name: "Grapes", price: 70),
    Product(id: 6, name: "Kiwi", price: 100),
    Product(id: 7, name: "Bananas", price: 30),
    Product(id: 8, name: "Gvava", price: 45)
  ];

  List<Product> products = [];
  bool isSearching = false;
  String query = "";
  List ima = [
    "assets/apple.jpg",
    "assets/mango.jpg",
    "assets/orange.jpg",
    "assets/pineapple.jpg",
    "assets/grapes.jpg",
    "assets/kiwi.jpg",
    "assets/banana.jpg",
    "assets/gavava.jpg",
  ];
  List<Product> cart = [];
  @override
  void initState() {
    products = allproducts;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        leading: Row(
          children: [
            // ignore: avoid_unnecessary_containers
            Container(
              child: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0011/6429/brand.gif?itok=Nl0rFljR",
                ),
                radius: 16,
              ),
            ),
            // Icon(Icons.local_grocery_store_sharp),
          ],
        ),
        title: isSearching
            ? TextFormField(
                onChanged: (s) => _search(s),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: "Search",
                ),
              )
            : const Text("Products"),
        // Row(
        //   children: const [
        //     //Icon(Icons.local_grocery_store),
        //     Text("K MART"),
        //   ],
        // ),
        actions: [
          IconButton(
              onPressed: () => setState(() {
                    isSearching = !isSearching;
                    _search("");
                  }),
              icon: Icon(isSearching ? Icons.close : Icons.search)),
          GestureDetector(
              onTap: () {
                setState(() {
                  print(res);
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(clipBehavior: Clip.none, children: [
                  ElevatedButton.icon(
                    onPressed: () async {
                      res = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CartList(items: cart),
                        ),
                      );
                    },
                    icon: Icon(Icons.local_grocery_store),
                    label: Text("cart"),
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                  ),
                  Positioned(
                      top: -8,
                      right: -8,
                      child: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        child: Text("${cart.length}"),
                      )),
                ]),
              )),
        ],
      ),
      body: products.isEmpty?const Text("NO DATA") :ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => item(products[index], ima[index]),
      ),
    );
  }

  item(Product product, im) {
    return Card(
      shadowColor: Color.fromARGB(255, 240, 17, 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue.withOpacity(0.5),
          child: ListTile(
              title: Text(product.name!),
              subtitle: Text('₹ ${product.price}/-'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () => isSearching = true,
                      icon: Icon(Icons.search)),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          if (cart.any((element) => element.id == product.id)) {
                            int changeIndex = cart.indexWhere(
                                (element) => element.id == product.id);
                            cart[changeIndex].qty = cart[changeIndex].qty! + 1;
                          } else {
                            setState(() {
                              cart.add(product);
                            });
                          }
                          print(cart);
                          total = 0;
                          for (var element in cart) {
                            setState(() {
                              total = total + element.qty! * element.price!;
                            });
                          }
                        });
                      },
                      icon: const Icon(Icons.currency_rupee),
                      label: const Text("Buy")),
                ],
              ),
              leading: SizedBox(
                  height: 100.0,
                  width: 100.0, // fixed width and height
                  child: Image.asset(
                    im,
                    fit: BoxFit.cover,
                  ))),
        ),
      ),
    );
  }

  _search(s) {
    setState(() {
      products = allproducts
          .where((element) =>
              element.name!.toLowerCase().startsWith(s.toLowerCase()))
          .toList();
    });
  }
}
