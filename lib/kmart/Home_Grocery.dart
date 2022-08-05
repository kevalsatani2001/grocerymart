import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomePageGrocery extends StatefulWidget {
  const HomePageGrocery({Key? key}) : super(key: key);

  @override
  State<HomePageGrocery> createState() => _HomePageGroceryState();
}

class _HomePageGroceryState extends State<HomePageGrocery> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Fruits",
              ),
              Tab(
                text: "Vegitables",
              )
            ],
          ),
          leading: Icon(Icons.local_grocery_store_sharp),
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
        body: Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              "https://dis-prod.assetful.loblaw.ca/content/dam/loblaw-companies-limited/creative-assets/freshmart/hp-hero-web.jpg/_jcr_content/renditions/cq5dam.web.1280.1280.jpeg",
              fit: BoxFit.cover,
            )),
      ),
    );
  }
}
