import 'package:amazonclone/common/widgets/custom_button.dart';
import 'package:amazonclone/common/widgets/custom_text_field.dart';
import 'package:amazonclone/constants/global_constants.dart';
import 'package:amazonclone/features/auth/services/auth_service.dart';
import 'package:flutter/material.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth-screen';
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _signinFormKey = GlobalKey<FormState>();
  final _signupFormKey = GlobalKey<FormState>();

  final AuthService authService = AuthService();
  // text editing controller
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
  }

  Auth _authValue = Auth.signup;

  void signUpUser() {
    authService.signupUser(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
      name: _nameController.text,
    );
  }

  void signInUser() {
    authService.signInUser(
        context: context,
        email: _emailController.text,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalVariables.greyBackgroundCOlor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SafeArea(
          child: Column(
            children: [
              Text(
                "Welcome",
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(fontSize: 22, fontWeight: FontWeight.w500),
              ),
              ListTile(
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4))),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signup,
                  groupValue: _authValue,
                  onChanged: (value) {
                    setState(() {
                      _authValue = value!;
                      // print(_authValue);
                    });
                  },
                ),
                tileColor: _authValue == Auth.signup
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Create Account",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (_authValue == Auth.signup)
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Form(
                    key: _signupFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: _nameController, hintText: "Name"),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: _emailController, hintText: "Email"),
                        const SizedBox(height: 10),
                        CustomTextField(
                          controller: _passwordController,
                          hintText: "Password",
                        ),
                        const SizedBox(height: 10),
                        CustomButton(
                          onTap: () {
                            bool isValid =
                                _signupFormKey.currentState!.validate();
                            if (isValid) {
                              signUpUser();
                            }
                          },
                          text: "Signup",
                        ),
                        // CustomTextField(controller: _nameController),
                        // CustomTextField(controller: _passwordController),
                      ],
                    ),
                  ),
                ),
              ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(4),
                    topRight: Radius.circular(4),
                  ),
                ),
                leading: Radio(
                  activeColor: GlobalVariables.secondaryColor,
                  value: Auth.signin,
                  groupValue: _authValue,
                  onChanged: (value) {
                    setState(() {
                      _authValue = value!;
                      // print(_authValue);
                    });
                  },
                ),
                tileColor: _authValue == Auth.signin
                    ? GlobalVariables.backgroundColor
                    : GlobalVariables.greyBackgroundCOlor,
                title: Text(
                  "Sign-In",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              if (_authValue == Auth.signin)
                Container(
                  decoration: const BoxDecoration(
                    color: GlobalVariables.backgroundColor,
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  child: Form(
                    key: _signinFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                            controller: _emailController, hintText: "Email"),
                        const SizedBox(height: 10),
                        CustomTextField(
                            controller: _passwordController,
                            hintText: "Password"),
                        const SizedBox(height: 10),
                        CustomButton(
                          onTap: () {
                            if (_signinFormKey.currentState!.validate()) {
                              signInUser();
                            }
                          },
                          text: "Signin",
                        ),
                        // CustomTextField(controller: _nameController),
                        // CustomTextField(controller: _passwordController),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
