// ignore_for_file: avoid_unnecessary_containers, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String email = '';
  String Password = '';
  String emailerror = '';
  String passworderror = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              Container(
                child: const CircleAvatar(
                  backgroundImage: NetworkImage(
                    "https://d1yjjnpx0p53s8.cloudfront.net/styles/logo-thumbnail/s3/0011/6429/brand.gif?itok=Nl0rFljR",
                  ),
                  radius: 16,
                ),
              ),
              const Icon(Icons.local_grocery_store_sharp),
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
            // mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.center,

            //padding: const EdgeInsets.only(left: 100),

            Container(
              height: MediaQuery.of(context).size.height,
              //width: MediaQuery.of(context).size.width,
              constraints: BoxConstraints.expand(),
              decoration: const BoxDecoration(
                gradient: SweepGradient(
                  colors: [
                    Colors.red,
                    Colors.yellow,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.green,
                    Colors.red,
                    Colors.yellow,
                    Colors.blue,
                    Colors.pink,
                    Colors.orange,
                    Colors.white

                    // Colors.white
                  ],
                  startAngle: 0.5,
                  endAngle: 8.5,
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Expanded(
                    child: Container(
                      // margin: EdgeInsets.all(120),
                      child: const Center(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/Einkaufswagen_%2824140951728%29.jpg/1200px-Einkaufswagen_%2824140951728%29.jpg",
                          ),
                          radius: 120,
                          //backgroundColor: Colors.red.withOpacity(0.5),
                        ),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple.withOpacity(0.5)),
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        decoration: const InputDecoration(
                            hintText: 'Enter your Email',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                emailerror.isEmpty
                    ? SizedBox()
                    : Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          emailerror,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple.withOpacity(0.5)),
                      margin: const EdgeInsets.all(10),
                      child: TextFormField(
                        onChanged: (value) => email = value,
                        decoration: const InputDecoration(
                            hintText: 'Enter The Password',
                            border: InputBorder.none),
                      ),
                    ),
                  ),
                ),
                passworderror.isEmpty
                    ? SizedBox()
                    : Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          passworderror,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        setState(() {
                          emailerror = '';
                          passworderror = '';
                          if (email.isEmpty) {
                            emailerror = 'Please Enter the email';
                          }
                          if (Password.isEmpty) {
                            passworderror = 'Please Enter the password';
                          }
                          if (email != '' && Password != '') {
                            if (!RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(email)) {
                              emailerror =
                                  'Please enter the valid email address';
                              return;
                            }
                          }
                          login();
                        });
                      },
                      // ignore: prefer_const_constructors
                      child: const Text(
                        'Log in',
                        style: TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey, primary: Colors.red),
                    ),
                    TextButton(
                      onPressed: () {
                        print(email);
                      },
                      // ignore: prefer_const_constructors
                      child: Text(
                        'Sign Up',
                        style: const TextStyle(color: Colors.black),
                      ),
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.grey, primary: Colors.red),
                    ),
                  ],
                )
              ],
            ),

            //CircleAvatar
            // color: Colors.red,
          ],
        ));
  }

  void login() async {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {});
    });
  }
}
