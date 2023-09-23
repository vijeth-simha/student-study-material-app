import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:student_study_material/services/storage_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> with TickerProviderStateMixin {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final StorageService _storageService = StorageService();
  late AnimationController controller;
  bool showSpinner = false;

  @override
  void initState() {
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 2),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    super.initState();
    initList();
  }

  void initList() async {
    setState(() {});
  }

  handleLogin() async {
    setState(() {
      showSpinner = true;
    });
    Response response = await post(
        Uri.https('04dcd84a-d617-40c8-b827-84969b37bf69.mock.pstmn.io',
            '/api/v1/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': emailController.text,
          'password': passwordController.text,
        }));
    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = json.decode(response.body);
      setState(() {
        showSpinner = false;
      });
      if (mounted) {
        // responseData.key = "authInfo";
        _storageService.writeSecureJSONData(responseData, "authInfo");
        Navigator.pushNamed(context, '/dashboard');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, colors: [
            Colors.blue[900]!,
            Colors.blue[800]!,
            Colors.blue[400]!
          ])),
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 80,
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const <Widget>[
                    Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 40),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Welcome Back",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60))),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 13.0, // soften the shadow
                                    spreadRadius: 5.0, //extend the shadow
                                    offset: Offset(
                                      5.0, // Move to right 5  horizontally
                                      5.0, // Move to bottom 5 Vertically
                                    ),
                                  )
                                ],
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 20),
                              child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: [
                                      TextFormField(
                                        controller: emailController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter your email"),
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                                  .hasMatch(value)) {
                                            return "Enter the email correctly";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      const SizedBox(height: 20),
                                      TextFormField(
                                        controller: passwordController,
                                        decoration: const InputDecoration(
                                            labelText: "Enter your password"),
                                        validator: (value) {
                                          if (value!.isEmpty ||
                                              !RegExp('[a-zA-Z]')
                                                  .hasMatch(value)) {
                                            return "Enter the name correctly";
                                          } else {
                                            return null;
                                          }
                                        },
                                      ),
                                      const SizedBox(
                                        height: 40,
                                      ),
                                      Container(
                                        height: 50,
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 50),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            color: Colors.blue[900]),
                                        child: Center(
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                primary: Colors
                                                    .blue[900], // background
                                                onPrimary: Colors.white,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            60.0)),
                                                fixedSize:
                                                    const Size(500.0, 10.0)),
                                            onPressed: () {
                                              if (formKey.currentState!
                                                  .validate()) {
                                                handleLogin();
                                              }
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                showSpinner
                                                    ? SizedBox(
                                                        height: 25.0,
                                                        width: 25.0,
                                                        child: Center(
                                                          child:
                                                              CircularProgressIndicator(
                                                            value: controller
                                                                .value,
                                                            semanticsLabel:
                                                                'Circular progress indicator',
                                                            strokeWidth: 2.0,
                                                          ),
                                                        ),
                                                      )
                                                    : Container(),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Text(showSpinner
                                                        ? 'Submitting..'
                                                        : 'Login')),
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue[900], // background
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                fixedSize: const Size(700.0, 10.0)),
                            onPressed: () {
                              Navigator.pushNamed(context, '/signup');
                            },
                            child: const Text('Signup'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
