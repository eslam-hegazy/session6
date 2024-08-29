import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:session6/register_screen.dart';
import 'package:session6/widgets/custom_botton.dart';
import 'package:session6/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  // login function
  void login({required String emailAddress, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      print(credential);
    } on FirebaseAuthException catch (e) {
      print("Message error: ${e.message}");
    }
  }

  @override
  Widget build(BuildContext context) {
    double height = context.height * 0.1;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius: height,
                    backgroundColor: Colors.red,
                    backgroundImage:
                        const AssetImage("assets/tree-736885_640.jpg"),
                  ),
                  const Text(
                    "Login!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  customTextField(
                      controller: emailController,
                      textInputType: TextInputType.emailAddress,
                      hintText: "Enter email address",
                      labelText: "Email"),
                  customTextField(
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      hintText: "Enter password",
                      labelText: "Password"),
                  customButton(
                      title: "Login",
                      press: () {
                        if (formKey.currentState!.validate()) {
                          login(emailAddress: emailController.text, password: passwordController.text);
                        }
                      }),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Don't have an account? "),
                      InkWell(
                        onTap: () {
                          Get.to(() => RegisterScreen());
                        },
                        child: const Text(
                          "Register",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
