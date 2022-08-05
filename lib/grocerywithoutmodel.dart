import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  num total = 0;
  List products = [
    {"id": 1, "name": "Apple", "price": 50, "q": 1},
    {"id": 2, "name": "Mango", "price": 70, "q": 1},
    {"id": 3, "name": "Orange", "price": 40, "q": 1},
    {"id": 4, "name": "Pineapple", "price": 50, "q": 1},
    {"id": 5, "name": "Grapes", "price": 70, "q": 1},
    {"id": 6, "name": "Kiwi", "price": 100, "q": 1},
    {"id": 7, "name": "Bananas", "price": 30, "q": 1},
    {"id": 8, "name": "Gavava", "price": 45, "q": 1},
  ];
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
  List cart = [];
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
        title: Row(
          children: const [
            //Icon(Icons.local_grocery_store),
            Text("K MART"),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(clipBehavior: Clip.none, children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {});
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
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) => item(products[index], ima[index]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text(" Your Amount is $total"),
            style: ElevatedButton.styleFrom(
              shadowColor: Color.fromARGB(255, 42, 223, 48),
              elevation: 50,

              //shape: RoundedRectangleBorder(borderRadius: Bor),
            ),
          ),
        ],
      ),
    );
  }

  item(product, im) {
    return Card(
      shadowColor: Color.fromARGB(255, 240, 17, 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.blue.withOpacity(0.5),
          child: ListTile(
              title: Text(product["name"]),
              subtitle: Text('₹ ${product["price"]}/-'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          if (cart.any(
                              (element) => element["id"] == product["id"])) {
                            int changeIndex = cart.indexWhere(
                                (element) => element["id"] == product["id"]);
                            cart[changeIndex]["q"] = cart[changeIndex]["q"] + 1;
                          } else {
                            setState(() {
                              cart.add(product);
                            });
                          }
                          print(cart);
                          total = 0;
                          for (var element in cart) {
                            setState(() {
                              total = total + element['q'] * element['price'];
                            });
                          }
                        });
                      },
                      icon: const Icon(Icons.currency_rupee),
                      label: const Text("Buy")),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          if (cart.any(
                              (element) => element["id"] == product["id"])) {
                            int changeIndex = cart.indexWhere(
                                (element) => element["id"] == product["id"]);
                            cart[changeIndex]["q"] = cart[changeIndex]["q"] + 1;
                          } else {
                            setState(() {
                              cart.add(product);
                            });
                          }
                          print(cart);
                          total = 0;
                          for (var element in cart) {
                            setState(() {
                              total = total + element['q'] * element['price'];
                            });
                          }
                        });
                      },
                      icon: const Icon(Icons.currency_rupee),
                      label: const Text("Remove")),
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
}
