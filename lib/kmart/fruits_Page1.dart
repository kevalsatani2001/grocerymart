import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class First_Frits extends StatefulWidget {
  const First_Frits({Key? key}) : super(key: key);

  @override
  State<First_Frits> createState() => _First_FritsState();
}

class _First_FritsState extends State<First_Frits> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    body: ListView.builder(
        padding: const EdgeInsets.only(bottom: kFloatingActionButtonMargin + 48),
        itemCount: 23,
        itemBuilder: (context, index) => ListTile(
              trailing: Text('$index'),
            ),
            ),
            
          
    
    );

      
    
  }
}