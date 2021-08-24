import 'package:catalog_app/utils/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({ Key? key }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = '';
  bool changedButton = false;
  final _formKey = GlobalKey<FormState>();

  postLogin() async {
    if (_formKey.currentState.validate()) {
      setState(() {
        changedButton = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        changedButton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/loginImage.png',
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.scaleDown,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 32,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                            hintText: "Enter username", labelText: "Username"),
                        onChanged: (value) {
                          name = value;
                          setState(() {});
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Username cannot be empty";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                            hintText: "Enter password", labelText: "Password"),
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Password cannot be empty";
                          } else if (value.length < 6) {
                            return "Password must be atleast 6 characters";
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () => postLogin()
                        // async {
                        // setState(() {
                        //   changedButton = true;
                        // });
                        // await Future.delayed(Duration(seconds: 1));
                        // await Navigator.pushNamed(
                        //     context, MyRoutes.homeRoute);
                        // setState(() {
                        //   changedButton = false;
                        // });
                        // },
                        ,
                        child: AnimatedContainer(
                          alignment: Alignment.center,
                          height: 50,
                          width: changedButton ? 50 : 150,
                          duration: Duration(seconds: 1),
                          decoration: BoxDecoration(
                            shape: changedButton
                                ? BoxShape.circle
                                : BoxShape.rectangle,
                            color:
                                changedButton ? Colors.green : Colors.blue[900],
                          ),
                          child: changedButton
                              ? Icon(
                                  Icons.done,
                                  color: Colors.white,
                                )
                              : Text(
                                  "Login",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                        ),
                      )
                      // ElevatedButton(
                      //   style: TextButton.styleFrom(
                      //     backgroundColor: Colors.blue[900],
                      //   ),
                      //   child: Text('Login'),
                      //   onPressed: () {
                      //     Navigator.pushNamed(context, MyRoutes.homeRoute);
                      //   },
                      // )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
