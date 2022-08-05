import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:grocerymart/cartlist1.dart';

import 'groceryinmodel.dart';
List<Product> cart = [];

class CartList extends StatefulWidget {
  const CartList({Key? key, required this.items}) : super(key: key);
  final List<Product> items;
  
  @override
  State<CartList> createState() => _CartListState();
}

class _CartListState extends State<CartList> {
  num total = 0;
  num i = 0;
  var changeIndex;

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
 
  @override
  void initState() {
    cart = widget.items;
    //cart.length=;
    for (var element in cart) {
      total = total + element.price! * element.qty!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
             var res= Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => Cart_List(),
                ),
              
              );
            },
            icon: Icon(Icons.arrow_back)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: Row(
          children: const [
            //Icon(Icons.local_grocery_store),
            Text("Products"),
          ],
        ),
        actions: [
          GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(clipBehavior: Clip.none, children: [
                  ElevatedButton.icon(
                    onPressed: () {},
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
        itemCount: cart.length,
        itemBuilder: (context, index) => item(cart[index], ima[index]),
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

  item(Product product, im) {
    return Card(
      shadowColor: Color.fromARGB(255, 240, 17, 1),
      child: Container(
        color: Colors.blue.withOpacity(0.5),
        child: Dismissible(
          key: Key('${product.id}'),
          direction: DismissDirection.endToStart,
          onDismissed: (dismiss){print(cart);
          cart.removeWhere((element) => element.id==product.id);},
          background: Container(
            alignment: Alignment.centerRight,
            color: Colors.red,
            child: const Icon(Icons.delete),
          ),
          child: ListTile(
              title: Text(product.name!),
              subtitle: Text('₹ ${product.price}/-'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("x ${product.qty}"),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        if (cart.any((element) => element.id == product.id)) {
                          changeIndex = cart.indexWhere(
                              (element) => element.id == product.id);
                          if (cart[changeIndex].qty == 1) {
                            cart.remove(product);
                          } else {
                            cart[changeIndex].qty = cart[changeIndex].qty! - 1;
                          }
                        }
                        //cart[changeIndex].qty = cart[changeIndex].qty! - 1;
                        //////////////////////////////  if(cart[changeIndex]==0){}

                        // } else {
                        //   setState(() {
                        //      cart[changeIndex].qty = cart[changeIndex].qty! - 1;
                        //     // cart.remove(product);
                        //   });
                        // }
                        total = 0;
                        for (var element in cart) {
                          setState(() {
                            total = total + (element.qty! * element.price!);

                            /// total= (cart[changeIndex].qty!* element.price!)-total;
                          });
                        }
                      });
                    },
                    //label: Text(""),
                    icon: Icon(Icons.remove),
                  )
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
