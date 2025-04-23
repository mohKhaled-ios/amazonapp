import 'package:amazonapp/common/widget/custom_button.dart';
import 'package:amazonapp/common/widget/custom_textfild.dart';
import 'package:amazonapp/conastant/global_var.dart';
import 'package:amazonapp/features/auth/services/auth_services.dart';
import 'package:flutter/material.dart';

enum Auth {
  signin,
  signup,
}

class Authscreen extends StatefulWidget {
  static const String routename = '/auth_screen';
  const Authscreen({super.key});

  @override
  State<Authscreen> createState() => _AuthscreenState();
}

class _AuthscreenState extends State<Authscreen> {
  Auth _auth = Auth.signup;
  final _signinformkey = GlobalKey<FormState>();
  final _signupformkey = GlobalKey<FormState>();
  final TextEditingController _emilcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();
  final TextEditingController _namecontroller = TextEditingController();
  final Authservice _authservice = Authservice();

  @override
  void dispose() {
    _emilcontroller.dispose();
    _passwordcontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  void signupuser() {
    _authservice.signup(
        name: _namecontroller.text,
        password: _passwordcontroller.text,
        email: _emilcontroller.text,
        context: context);
  }

  void signinuser() {
    _authservice.signin(
        password: _passwordcontroller.text,
        email: _emilcontroller.text,
        context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Globalvar.greybackgroundcolor,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'welcome to my amazon app',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
                ListTile(
                  tileColor: _auth == Auth.signup
                      ? Globalvar.backgroundcolor
                      : Globalvar.greybackgroundcolor,
                  title: Text(
                    'create account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                      activeColor: Globalvar.secondarycolor,
                      value: Auth.signup,
                      groupValue: _auth,
                      onChanged: ((Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      })),
                ),
                if (_auth == Auth.signup)
                  Container(
                    color: Globalvar.backgroundcolor,
                    padding: EdgeInsets.all(8),
                    child: Form(
                        key: _signupformkey,
                        child: Column(
                          children: [
                            Customtextfild(
                              Controller: _namecontroller,
                              hinttext: 'enter your name',
                            ),
                            Customtextfild(
                              Controller: _emilcontroller,
                              hinttext: 'enter your email',
                            ),
                            Customtextfild(
                              Controller: _passwordcontroller,
                              hinttext: 'enter your password',
                            ),
                            Mycustombutton(
                                text: "sign up",
                                onpress: () {
                                  if (_signupformkey.currentState!.validate()) {
                                    signupuser();
                                  }
                                })
                          ],
                        )),
                  ),
                ListTile(
                  tileColor: _auth == Auth.signin
                      ? Globalvar.backgroundcolor
                      : Globalvar.greybackgroundcolor,
                  title: Text(
                    'sign in',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  leading: Radio(
                      activeColor: Globalvar.secondarycolor,
                      value: Auth.signin,
                      groupValue: _auth,
                      onChanged: ((Auth? val) {
                        setState(() {
                          _auth = val!;
                        });
                      })),
                ),
                if (_auth == Auth.signin)
                  Container(
                    color: Globalvar.backgroundcolor,
                    padding: EdgeInsets.all(8),
                    child: Form(
                        key: _signinformkey,
                        child: Column(
                          children: [
                            Customtextfild(
                              Controller: _emilcontroller,
                              hinttext: 'enter your email',
                            ),
                            Customtextfild(
                              Controller: _passwordcontroller,
                              hinttext: 'enter your password',
                            ),
                            Mycustombutton(
                                text: "sign in",
                                onpress: () {
                                  if (_signinformkey.currentState!.validate()) {
                                    signinuser();
                                  }
                                })
                          ],
                        )),
                  ),
              ],
            ),
          ),
        )));
  }
}
