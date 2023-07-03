import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:four20society/constants/colors/app_colors.dart';
import 'package:four20society/constants/routes/routes_name.dart';
import 'package:four20society/global_widget/bottom_nav.dart';
import 'package:four20society/global_widget/custom_button.dart';
import 'package:four20society/global_widget/input_fields.dart';
import 'package:http/http.dart' as http;
import 'package:four20society/constants/apis_path/api_config_string.dart';
import '../../../../utils/local_storage/local_storage.dart';
import '../../forget_password/api_helper/forget_password_screen_api_helper.dart';
import 'package:four20society/lib/utils/local_storage/local_storage.dart';


class LoginScreen extends StatefulWidget {
  bool isSlot;
   LoginScreen({super.key, this.isSlot = false});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String groupValue = "USER";
  bool isTextObscure = true;
  final TextEditingController loginIdController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LocalStorageService localStorageService = LocalStorageService();
  final _formKey = GlobalKey<FormState>();


  @override
  void dispose() {
    loginIdController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {
    // DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
    return Scaffold(
      key: _formKey,
        body: Stack(
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Image.network("https://wallpapercave.com/wp/wp2490640.jpg",
                fit: BoxFit.cover)),
        Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(top: 60, left: 45, right: 45),
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(214),
                      topRight: Radius.circular(214))),
              child: Column(
                children: [
                  const Text("Welcome again!",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 30),
                  InputFieldWidget(
                    validator: (value) {
                      if(value==null || value.isEmpty){
                        return "Please enter user name";
                      }
                      return null;
                    },
                      controller: loginIdController, hintText: 'user Name'),
                  InputFieldWidget(
                    obscureText: true,
                    controller: passwordController,
                    hintText: 'password',
                    sufferIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isTextObscure = !isTextObscure;
                        });
                      },
                      icon: Icon(
                        isTextObscure
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: AppColors.buttonColor,
                      ),
                    ),
                    // sufferIcon: const Icon(Icons.visibility),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRoute.forgetPassword, (route) => false);
                      },
                      child: const Text(
                        "forgot Your Password?",
                        style: TextStyle(color: AppColors.buttonColor),
                      ),
                    ),
                  ),
                  const SizedBox(height: 90),
                  CustomElevatedButton(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const HomePageWithBottomBar()));
                    },
                    title: "LOGIN",
                    color: AppColors.buttonColor,
                  ),
                  const SizedBox(height: 21),
                  RichText(
                      text: TextSpan(
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                        const TextSpan(
                            text: 'Don’t Have an Account?',
                            style: TextStyle(color: Colors.black)),
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    AppRoute.registrationScreen,
                                    (route) => false);
                              },
                            text: ' SIGNUP NOW',
                            style: const TextStyle(
                                color: AppColors.app_bottombar_color))
                      ])),
                  const Text("Or Login With"),
                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.facebook_outlined),
                      Icon(Icons.apple),
                    ],
                  )
                ],
              ),
            ))
      ],
    ));
  }
}

Future<void> loginData(BuildContext context, String stEmail,
    String stPassword, String groupValue) async {
  if(kDebugMode){
   print(stEmail);
    print(stPassword);
}
  final Map<String, dynamic> reqModel = {
    "email": stEmail.trim(),
    "password": stPassword.trim(),
    'user_type': groupValue.trim(),

  };
  log("reqModel--->$reqModel");
  final Map<String, dynamic> data = {
    "user": reqModel,
  };
  var  response = await http.post(Uri.parse(ApiEndPoints.login), body: data);
  var jsonResponse = json.decode(response.body);
  var resMsg = jsonResponse['message'];
  if (response.statusCode == 200) {
    print("result");
    final authTokens = jsonResponse['data']['auth_token'].toString();
    print("authTokens--->$authTokens");
     //
     // localStorageService.saveToDisk(
     //   LocalStorageService.AUTH_TOKEN, auth_token.trim());
     //
     // localStrorageService.saveToDisk(
     //   LocalStorageService.USER_NAME, user_name.trim());


  }
  else {
    print("hello");
    print("resMsg--->$resMsg");


  }
}



