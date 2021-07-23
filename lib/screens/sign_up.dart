import 'package:filmder/screens/sign_in.dart';
import 'package:filmder/theme/colors.dart';
import 'package:filmder/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignUp extends StatefulWidget {
  const SignUp();

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late String username, email, password;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  validator: Validators.compose([
                    Validators.required("Please fill in your username"),
                    Validators.minLength(3, "You need atleast 3 characters")
                  ]),
                  decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: hexColor)),
                      labelText: "Username",
                      helperText: "Minimum of 3 characters"),
                  onChanged: (val) {
                    username = val;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextFormField(
                  validator: Validators.compose([
                    Validators.required("Please fill in your email"),
                    Validators.email("Fill in valid email address")
                  ]),
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: hexColor)),
                    labelText: "E-mail",
                  ),
                  onChanged: (val) {
                    email = val;
                  },
                ),
              ),
              TextFormField(
                validator: Validators.compose([
                  Validators.required("Please fill in your password"),
                  Validators.minLength(8, "Must be atleast 8 characters long"),
                  Validators.patternRegExp(
                      RegExp(
                          "^(?=.{8,}\$)(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#\$%^&*(),.?:{}|<>]).*"),
                      "")
                ]),
                decoration: InputDecoration(
                    hintText: 'Password',
                    border: new OutlineInputBorder(
                        borderSide: BorderSide(color: hexColor)),
                    labelText: 'Password',
                    helperMaxLines: 3,
                    helperText:
                        "Must be 8 characters long, contain at least one lowercase letter,one uppercase letter, one number and a special character"),
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    color: hexColor,
                    border: Border.all(color: hexColor),
                    borderRadius: BorderRadius.circular(3)),
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width - 32,
                child: Text("Sign Up ",
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(fontSize: 16)),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignIn()));
                    },
                    child: Text(
                      "Sign In",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(decoration: TextDecoration.underline),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
