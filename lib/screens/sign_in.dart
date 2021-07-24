import 'package:filmder/screens/home.dart';
import 'package:filmder/screens/sign_up.dart';
import 'package:filmder/services/auth.dart';
import 'package:filmder/theme/colors.dart';
import 'package:filmder/theme/theme.dart';
import 'package:filmder/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

class SignIn extends StatefulWidget {
  const SignIn();

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  late String email, password;
  AuthService authService = new AuthService();
  bool isLoading = false;

  signIn() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      await authService
          .signInWithEmailAndPassword(email, password)
          .then((value) {
        if (value != null) {
          setState(() {
            isLoading = false;
          });
        }
      });

      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

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
              TextFormField(
                validator: Validators.compose([
                  Validators.required("Please fill in your email"),
                ]),
                decoration: InputDecoration(
                  hintText: "E-mail",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: hexColor, width: 3)),
                  labelText: "E-mail",
                  labelStyle: TextStyle(
                      color:
                          isLightTheme(context) ? Colors.grey : Colors.white),
                ),
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                obscureText: true,
                validator: Validators.compose(
                  [Validators.required("Please fill in your password")],
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Password',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: hexColor, width: 3)),
                  labelText: 'Password',
                  labelStyle: TextStyle(
                      color:
                          isLightTheme(context) ? Colors.grey : Colors.white),
                ),
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
                child: GestureDetector(
                  onTap: () {
                    signIn();
                  },
                  child: Text("Sign in ",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 16)),
                ),
              ),
              SizedBox(
                height: 18,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Dont have an Account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                    },
                    child: Text(
                      "Sign Up",
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
