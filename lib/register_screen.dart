import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:session6/widgets/custom_botton.dart';
import 'package:session6/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();


  // register function
  void register({required String emailAddress,required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      print(credential);
    } on FirebaseAuthException catch (e) {
      print("error message: ${e.message}");
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register Screen"),
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
                    radius: context.height * 0.1,
                    backgroundColor: Colors.red,
                    backgroundImage: const AssetImage("assets/free-images.png"),
                  ),
                  const Text(
                    "Login!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  customTextField(
                      controller: nameController,
                      textInputType: TextInputType.emailAddress,
                      hintText: "Enter name",
                      labelText: "Name"),
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
                    title: "Register",
                    press: () {
                      if (formKey.currentState!.validate()) {
                        register(emailAddress: emailController.text, password: passwordController.text);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Do you have an account? "),
                      Text(
                        "Login",
                        style: TextStyle(fontWeight: FontWeight.bold),
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
