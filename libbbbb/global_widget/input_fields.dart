
import 'package:flutter/material.dart';
class InputFieldWidget extends StatelessWidget {
  final bool obscureText;
  final String hintText;
  final Widget sufferIcon;
  final String? Function(String?)? validator;
  final TextEditingController controller;
  final AutovalidateMode? autoValidateMode;
  const InputFieldWidget({super.key,required this.hintText, this.sufferIcon = const SizedBox.shrink(),required this.controller, this.validator, this.autoValidateMode, this.obscureText=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(6),
      child: TextFormField(
        obscureText: obscureText,
        scrollPadding: EdgeInsets.zero,
        controller: controller,
        validator: validator,
        autovalidateMode: autoValidateMode,
        decoration:  InputDecoration(
          isDense: true,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
         focusColor: Colors.white.withOpacity(0.2),
           fillColor: Colors.white.withOpacity(0.2),
          focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:  BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
          enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide:  BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
          focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
          errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: Colors.black.withOpacity(0.2),
                  ),
                ),
          hintText: hintText,
          suffixIcon: sufferIcon
      ))
    );
  }
}






//
// import 'dart:convert';
//
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:four20society/constants/colors/app_colors.dart';
// import 'package:four20society/constants/routes/routes_name.dart';
// import 'package:four20society/global_widget/bottom_nav.dart';
// import 'package:four20society/global_widget/custom_button.dart';
// import 'package:four20society/global_widget/input_fields.dart';
// import 'package:http/http.dart';
//
// import '../../../../utils/local_storage/local_storage.dart';
//
// class LoginScreen extends StatefulWidget {
//   bool isSlot;
//   LoginScreen({super.key, this.isSlot = false});
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   String groupValue = "USER";
//   bool isTextObscure = true;
//   final TextEditingController loginIdController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   LocalStorageService localStorageService = LocalStorageService();
//   final _formKey = GlobalKey<FormState>();
//
//
//   @override
//   Widget build(BuildContext context) {
//     // DeviceSizeConfig deviceSizeConfig = DeviceSizeConfig(context);
//     return Scaffold(
//         key: _formKey,
//         body: Stack(
//           children: [
//             SizedBox(
//                 height: MediaQuery.of(context).size.height,
//                 child: Image.network("https://wallpapercave.com/wp/wp2490640.jpg",
//                     fit: BoxFit.cover)),
//             Positioned(
//                 bottom: 0,
//                 child: Container(
//                   padding: const EdgeInsets.only(top: 60, left: 45, right: 45),
//                   height: MediaQuery.of(context).size.height * 0.7,
//                   width: MediaQuery.of(context).size.width,
//                   decoration: const BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(214),
//                           topRight: Radius.circular(214))),
//                   child: Column(
//                     children: [
//                       const Text("Welcome again!",
//                           style:
//                           TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
//                       const SizedBox(height: 30),
//                       InputFieldWidget(
//                         validator: (value) {
//                           if(value == null || value.isEmpty){
//                             return "Please enter user name";
//                           }
//                           return null;
//                         },
//                         controller: loginIdController, hintText: 'user Name',
//                         // keyboardType: TextInputType.emailAddress,
//                       ),
//
//                       InputFieldWidget(
//                         validator: (value) {
//                           if(value == null || value.isEmpty){
//                             return "Please enter password";
//                           }
//                           return null;
//                         },
//                         obscureText: true,
//                         controller: passwordController,
//                         // keyboardType: TextInputType.text,
//                         hintText: 'password',
//                         sufferIcon: GestureDetector(
//                           onTap: () {
//                             setState(() {
//                               isTextObscure = !isTextObscure;
//                             });
//                           },
//                         ),
//                         // sufferIcon: const Icon(Icons.visibility),
//                       ),
//                       Align(
//                         alignment: Alignment.centerRight,
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.pushNamedAndRemoveUntil(
//                                 context, AppRoute.forgetPassword, (route) => false);
//                           },
//                           child: const Text(
//                             "forgot Your Password?",
//                             style: TextStyle(color: AppColors.buttonColor),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(height: 90),
//                       CustomElevatedButton(
//                         onTap: () {
//                           Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                   const HomePageWithBottomBar()));
//                         },
//                         title: "LOGIN",
//                         color: AppColors.buttonColor,
//                       ),
//                       const SizedBox(height: 21),
//                       RichText(
//                           text: TextSpan(
//                               style: const TextStyle(
//                                   fontSize: 16, fontWeight: FontWeight.w400),
//                               children: <TextSpan>[
//                                 const TextSpan(
//                                     text: 'Don’t Have an Account?',
//                                     style: TextStyle(color: Colors.black)),
//                                 TextSpan(
//                                     recognizer: TapGestureRecognizer()
//                                       ..onTap = () {
//                                         Navigator.pushNamedAndRemoveUntil(
//                                             context,
//                                             AppRoute.registrationScreen,
//                                                 (route) => false);
//                                       },
//                                     text: ' SIGNUP NOW',
//                                     style: const TextStyle(
//                                         color: AppColors.app_bottombar_color))
//                               ])),
//                       const Text("Or Login With"),
//                       const SizedBox(height: 10),
//                       const Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icons.facebook_outlined),
//                           Icon(Icons.apple),
//                         ],
//                       )
//                     ],
//                   ),
//                 ))
//           ],
//         ));
//   }
// }
