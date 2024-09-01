import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../main.dart';
import '../services/auth_service.dart';
import '../utils/utils.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onClickedSignUp;
  const LoginPage({
    Key? key,
    required this.onClickedSignUp,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? errorMessage = '';
  final formKey = GlobalKey<FormState>();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  Future signIn() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(child: CircularProgressIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: controllerEmail.text.trim(),
          password: controllerPassword.text.trim());
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
      Utils.showSnackBar(e.message);
    }
    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(246, 2, 21, 35),
      body: SingleChildScrollView(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(
                  height: 50,
                ),
                Icon(
                  Icons.import_contacts_outlined,
                  size: 100,
                  color: Colors.indigo.shade200,
                ),
                const Text(
                  'ICT NOTES AND\n PAST-PAPERS',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.indigo),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.indigo.shade100),
                    controller: controllerEmail,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (email) =>
                        email != null && !EmailValidator.validate(email)
                            ? 'Enter a valid email'
                            : null,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gapPadding: 0.0),
                        label: Row(
                          children: [
                            Icon(
                              Icons.mail_outline,
                              color: Colors.indigo.shade200,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('Email Address')
                          ],
                        ),
                        // labelText: '',
                        labelStyle: const TextStyle(color: Colors.indigo),
                        fillColor: Colors.indigoAccent.withOpacity(0.2),
                        filled: true),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    style: TextStyle(color: Colors.indigo.shade100),
                    obscureText: true,
                    controller: controllerPassword,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) => value != null && value.length < 6
                        ? 'Enter min. 6 characters'
                        : null,
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            gapPadding: 0.0),
                        label: Row(
                          children: [
                            Icon(
                              Icons.lock_open,
                              color: Colors.indigo.shade200,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            const Text('Password')
                          ],
                        ),
                        // labelText: '',
                        labelStyle: const TextStyle(color: Colors.indigo),
                        fillColor: Colors.indigoAccent.withOpacity(0.2),
                        filled: true),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo.shade700,
                      minimumSize: const Size(300, 50),
                      maximumSize: const Size(300, 50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: signIn,
                    child: const Text('login')),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                    text: TextSpan(text: 'Create Account? ', children: [
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = widget.onClickedSignUp,
                      text: 'SignIn',
                      style: const TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.indigoAccent))
                ])),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'OR',
                  style: TextStyle(color: Colors.indigo.shade100),
                ),
                const SizedBox(
                  height: 10,
                ),
                OutlinedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo.shade700,
                    animationDuration: const Duration(
                      seconds: 4,
                    ),
                    shadowColor: Colors.indigo.shade200,
                    minimumSize: const Size(300, 50),
                    maximumSize: const Size(300, 50),
                    shape: const StadiumBorder(),
                  ),
                  onPressed: () {
                    AuthService();
                  },
                  child: const Text(
                    'Continue without SignIn',
                    style: TextStyle(color: Colors.white),
                  ),
                )
                //TODO:
                /* OutlinedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black38,
                      animationDuration: const Duration(
                        seconds: 4,
                      ),
                      shadowColor: Colors.indigo.shade200,
                      minimumSize: const Size(300, 50),
                      maximumSize: const Size(300, 50),
                      shape: const StadiumBorder(),
                    ),
                    onPressed: () {
                      AuthService().signInWithGoogle();
                    },
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/google.png',
                          colorBlendMode: BlendMode.lighten,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'SignIn With Google',
                          style: TextStyle(color: Colors.indigo.shade200),
                        )
                      ],
                    )),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
