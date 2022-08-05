import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Text_Form_Field extends StatefulWidget {
  const Text_Form_Field({Key? key}) : super(key: key);

  @override
  State<Text_Form_Field> createState() => _Text_Form_FieldState();
}

class _Text_Form_FieldState extends State<Text_Form_Field> {
  String email = '';
  String emailError = '';
  String password = '';
  String passwordError = '';
  String message = '';
  bool isLoading = false;
  bool isPassHiden = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //const TextField(),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.red.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)),
              child: TextFormField(
                  onChanged: (value) => email = value,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Enter your Email',
                  )),
            ),
            emailError.isEmpty
                ? SizedBox()
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      emailError,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  TextFormField(
                      obscureText: isPassHiden,
                      onChanged: (value) => password = value,
                      decoration: InputDecoration(
                        suffixIcon: isPassHiden
                            ? GestureDetector(
                                onTap: () => toggle(),
                                child: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              )
                            : GestureDetector(
                                onTap: () => toggle(),
                                child: const Icon(
                                  Icons.visibility,
                                )),
                        border: InputBorder.none,
                        hintText: 'Enter your Password',
                      )),
                  passwordError.isEmpty
                      ? SizedBox()
                      : Container(
                          width: double.infinity,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            passwordError,
                            style: const TextStyle(color: Colors.red),
                          ),
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
                onPressed: isLoading
                    ? null
                    : () {
                        setState(() {
                          emailError = '';
                          passwordError = '';
                          message = '';
                          if (email.isEmpty) {
                            emailError = "Field cannot be empty";
                          }

                          if (password.isEmpty) {
                            passwordError = "Field cannot be empty";
                          }
                          if (email != '' && password != '') {
                            if (!RegExp(
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                .hasMatch(email)) {
                              emailError = "Please enter valid email address";
                              return;
                            }
                            isLoading = true;
                            login();
                          }
                        });
                      },
                child: isLoading
                    ? CircularProgressIndicator()
                    : const Text("cheak ")),
            Container(
              padding: const EdgeInsets.all(10),
              child: Text(message),
            )
          ],
        ),
      ),
    );
  }

  void login() async {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        message = "Login Success";
        isLoading = true;
      });
    });
  }

  toggle() {
    setState(() {
      isPassHiden = !isPassHiden;
    });
  }
}
