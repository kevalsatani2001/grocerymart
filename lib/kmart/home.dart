// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Row(
          children: [
            Container(
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0011/6429/brand.gif?itok=Nl0rFljR",
                ),
                radius: 16,
              ),
            ),
            Icon(Icons.local_grocery_store_sharp),
          ],
        ),
        title: Row(
          children: const [
            //Icon(Icons.local_grocery_store),
            Text("K MART"),
          ],
        ),
        actions: const [
          Icon(Icons.more_vert_rounded),
        ],
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://dis-prod.assetful.loblaw.ca/content/dam/loblaw-companies-limited/creative-assets/freshmart/hp-hero-web.jpg/_jcr_content/renditions/cq5dam.web.1280.1280.jpeg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const View_Product()));
                    },
                    // ignore: sort_child_properties_last
                    child: Text(
                      "View Product",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.5))),
                TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(MaterialPageRoute(
                      //     builder: (context) => View_Product()));
                    },
                    // ignore: sort_child_properties_last
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.money),
                        Text(
                          "View offer",
                          style: TextStyle(color: Colors.black),
                        ),
                        Icon(Icons.money),
                      ],
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.5))),
                TextButton(
                    onPressed: () {},
                    // ignore: sort_child_properties_last
                    child: Text(
                      "EXIT",
                      style: TextStyle(color: Colors.black),
                    ),
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(0.5))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class View_Product extends StatefulWidget {
  const View_Product({Key? key}) : super(key: key);

  @override
  State<View_Product> createState() => _View_ProductState();
}

class _View_ProductState extends State<View_Product> {
  var i = 0;
  List cla = [f1(), v1(), g1(), b1(), o1()];
  List<String> product = ["Fruits", "Vegitables", "Grocery", "Bekry", "Other"];
  List image = [
    "assets/fruit.jpg",
    "assets/vegitable.jpg",
    "assets/grocery.jpg",
    "assets/bekry.jpg",
    "assets/other.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("View Product"),
          actions: const [
            Icon(Icons.more_vert_rounded),
          ],
        ),
        body: ListView.builder(
            itemCount: product.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Container(
                  height: 200,
                  // ignore: sort_child_properties_last
                  child: Center(
                      child: Container(
                    color: Colors.red,
                    height: 30,
                    // child: Text(
                    //   product[index],
                    //   style: TextStyle(
                    //     fontStyle: FontStyle.italic,
                    //     fontSize: 18,
                    //   ),
                    // )
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => cla[index]));
                      },
                      child: Text(product[index]),
                    ),
                  )),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage(image[index]),
                      fit: BoxFit.cover,
                    ),

                    //shape: BoxShape.circle,
                  ),
                  //color: Colors.red,
                ),
              );
            }));
  }
}

class f1 extends StatefulWidget {
  const f1({Key? key}) : super(key: key);

  @override
  State<f1> createState() => _f1State();
}

class _f1State extends State<f1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("fruits"),
    );
  }
}

class v1 extends StatefulWidget {
  const v1({Key? key}) : super(key: key);

  @override
  State<v1> createState() => _v1State();
}

class _v1State extends State<v1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Vegitable"),
    );
  }
}

class g1 extends StatefulWidget {
  const g1({Key? key}) : super(key: key);

  @override
  State<g1> createState() => _g1State();
}

class _g1State extends State<g1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("grocery"),
    );
  }
}

class b1 extends StatefulWidget {
  const b1({Key? key}) : super(key: key);

  @override
  State<b1> createState() => _b1State();
}

class _b1State extends State<b1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Bekry"),
    );
  }
}

class o1 extends StatefulWidget {
  const o1({Key? key}) : super(key: key);

  @override
  State<o1> createState() => _o1State();
}

class _o1State extends State<o1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("other"),
    );
  }
}
