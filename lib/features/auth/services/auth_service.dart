import 'dart:convert';

import 'package:amazonclone/constants/error_handling.dart';
import 'package:amazonclone/features/home/home_screen.dart';
import 'package:amazonclone/providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../constants/global_constants.dart';
import 'package:amazonclone/constants/utils.dart';
import 'package:amazonclone/models/user.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthService {
  // signup user
  void signupUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
          id: '',
          name: name,
          email: email,
          password: password,
          address: "",
          type: "",
          token: "");

      final response = await http.post(
        Uri.parse('$uri/api/signup'),
        // Uri.parse(
        //     "https://flutter-prep-c2155-default-rtdb.firebaseio.com/signup.json"),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // print(response.body);
      // print(response.statusCode);

      // ignore: use_build_context_synchronously
      httpErrorHandle(
        response: response,
        context: context,
        onSucess: () {
          showSnackBar(context, "Account created login with same credentials");
        },
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      showSnackBar(context, e.toString());
    }
  }

  // Siginin Of User
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/api/signin'),
        // Uri.parse(
        //     "https://flutter-prep-c2155-default-rtdb.firebaseio.com/signup.json"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // print(response.body);
      // print("Hello");
      // print(response.statusCode);

      if (!context.mounted) {
        return;
      }

      httpErrorHandle(
        response: response,
        context: context,
        onSucess: () async {
          // print(response.body);
          final prefs = await SharedPreferences.getInstance();
          if (!context.mounted) {
            return;
          }
          Provider.of<UserProvider>(context, listen: false)
              .setUser(response.body);
          showSnackBar(context, "Login Successful");
          await prefs.setString(
              'x-auth-token', jsonDecode(response.body)['token']);

          if (!context.mounted) {
            return;
          }
          Navigator.pushNamedAndRemoveUntil(
              context, HomeScreen.routeName, (route) => false);
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  //  Get User Data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');
      print(token);
      if (token == null) {
        prefs.setString('x-auth-token', '');
      }
      print(token);
      var tokenRes = await http
          .post(Uri.parse("$uri/tokenIsValid"), headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'x-auth-token': token!,
      });
      print(token);
      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        // await  and get the user data
        http.Response userRes = await http.get(
          Uri.parse("$uri/"),
          headers: {
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token': token,
          },
        );

        if (!context.mounted) {
          return;
        }
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
        print(userRes.body);
      }
    } catch (e) {
      if (!context.mounted) {
        return;
      }
      showSnackBar(context, e.toString());
    }
  }
}
