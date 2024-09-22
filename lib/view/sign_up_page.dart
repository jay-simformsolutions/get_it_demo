import 'package:flutter/material.dart';
import 'package:get_it_demo/common_widget/text_field_widget.dart';
import 'package:get_it_demo/navigation/route_strings.dart';
import 'package:get_it_demo/values/string_constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    emailController = TextEditingController();
  }

  bool isValidEmail(String email) {
    final bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
    return emailValid;
  }

  String? validateUserName(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return StringConstants.nameError;
    }
    return null;
  }

  String? validateEmail(String? value, BuildContext context) {
    if (value == null || value.isEmpty) {
      return StringConstants.emailError;
    } else if (!isValidEmail(value)) {
      return StringConstants.enterValidEmailError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            StringConstants.signUpTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                  icon: Icons.person,
                  controller: nameController,
                  hintText: StringConstants.nameHintText,
                  keyboardType: TextInputType.name,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  textInputAction: TextInputAction.next,
                  validator: (name) => validateUserName(name, context)),
              const SizedBox(height: 20),
              TextFieldWidget(
                icon: Icons.email,
                controller: emailController,
                hintText: StringConstants.emailHintText,
                keyboardType: TextInputType.emailAddress,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.done,
                validator: (email) => validateEmail(email, context),
                onFieldSubmitted: (_) {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, RouteStrings.loginRoute);
                  }
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pushNamed(context, RouteStrings.loginRoute);
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.35,
                    vertical: 8,
                  ),
                  child: const Text(StringConstants.signUpTitle),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
