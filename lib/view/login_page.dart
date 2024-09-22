import 'package:flutter/material.dart';
import 'package:get_it_demo/common_widget/text_field_widget.dart';
import 'package:get_it_demo/navigation/route_strings.dart';
import 'package:get_it_demo/values/string_constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController usernameController;
  late TextEditingController passwordController;
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    usernameController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  String? validateUserName(String? username) {
    if (username == null || username.isEmpty) {
      return StringConstants.userNameError;
    }
    return null;
  }

  String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return StringConstants.passwordError;
    }
    return null;
  }

  void validateAndNavigate() {
    if (_formKey.currentState!.validate()) {
      /// step-3 Get Shared_Preference Object and save username and password
      Navigator.pushNamed(context, RouteStrings.homePageRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            StringConstants.loginTitle,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFieldWidget(
                icon: Icons.person_2,
                hintText: StringConstants.uerNameHintText,
                controller: usernameController,
                keyboardType: TextInputType.name,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.next,
                validator: (username) => validateUserName(username),
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                isPasswordField: true,
                icon: Icons.lock,
                hintText: StringConstants.passwordHintText,
                controller: passwordController,
                keyboardType: TextInputType.name,
                autoValidateMode: AutovalidateMode.onUserInteraction,
                textInputAction: TextInputAction.done,
                validator: (password) => validatePassword(password),
                onFieldSubmitted: (_) => validateAndNavigate(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => validateAndNavigate(),
                child: const Text(
                  StringConstants.loginTitle,
                ),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     final a = getIt.get<TempClass4>(
              //       param1: "Jay Akbari",
              //     );
              //     print(a.name);
              //     Navigator.pushNamed(
              //       context,
              //       RouteStrings.tempCounter,
              //     );
              //   },
              //   child: const Text("Pass counter"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
