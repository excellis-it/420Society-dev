import 'package:flutter/material.dart';
import 'package:four20society/global_widget/custom_button.dart';

class CustomTodayProductCardWidget extends StatelessWidget {
  const CustomTodayProductCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Container(
      height: _screenHeight * 0.45,
      // color: Colors.red,
      margin: const EdgeInsets.all(12),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(8),
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  // height: 200,
                  width: 220,
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 46),
                        decoration: const BoxDecoration(
                          color: Color(0xFF00C8B8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(360),
                            topRight: Radius.circular(360),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "assets/img/intro2.png",
                              fit: BoxFit.fill,
                              width: 180,
                              height: 130,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: '25% ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 42),
                                  ),
                                  TextSpan(
                                    text: 'off\n',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                  TextSpan(
                                    text: 'Lorem Ispum Dolor\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\$ 152',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  // height: 200,
                  width: 220,
                  margin: const EdgeInsets.only(right: 20),
                  padding: const EdgeInsets.all(8),
                  child: Stack(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 46),
                        decoration: const BoxDecoration(
                          color: Color(0xFF00C8B8),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(360),
                            topRight: Radius.circular(360),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topCenter,
                            child: Image.asset(
                              "assets/img/jeff-w-1ieS-iMjnAU-unsplash-removebg-preview.png",
                              fit: BoxFit.fill,
                              width: 180,
                              height: 130,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                                children: [
                                  TextSpan(
                                    text: '15% ',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 42),
                                  ),
                                  TextSpan(
                                    text: 'off\n',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18),
                                  ),
                                  TextSpan(
                                    text: 'Lorem Ispum Dolor\n',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '\$ 152',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
