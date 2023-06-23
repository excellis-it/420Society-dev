import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:four20society/feature/change_password/presentation/change_password%20(1).dart';
import 'package:four20society/feature/notification/presentation/notification_screen.dart';
import 'package:four20society/feature/profile/presentaion/personalDetails.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  File? galleryFile;
  final picker = ImagePicker();

  late File imageFile;

  @override
  Widget build(BuildContext context) {
    // File? image;

    // ImagePicker picker = ImagePicker();
    // XFile? image;
    // Future<void> getImage() async {
    //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    //   setState(() {
    //     _image = image;
    //   });
    // }

//     XFile? image;
//
//     final ImagePicker picker = ImagePicker();
//
// //   //we can upload image from camera or from gallery based on parameter
//     Future getImage(ImageSource media) async {
//       var img = await picker.pickImage(source: media);
// //
//       setState(() {
//         image = img;
//       });
//     }

    //   //show popup dialog
    // void myAlert() {
    //   showDialog(
    //       context: context,
    //       builder: (BuildContext context) {
    //         return AlertDialog(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(8)),
    //           title: const Text('Please choose media to select'),
    //           content: Container(
    //             height: MediaQuery.of(context).size.height / 6,
    //             child: Column(
    //               children: [
    //                 ElevatedButton(
    //                   //if user click this button, user can upload image from gallery
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                     getImage(ImageSource.gallery);
    //                   },
    //                   child: const Row(
    //                     children: [
    //                       Icon(Icons.image),
    //                       Text('From Gallery'),
    //                     ],
    //                   ),
    //                 ),
    //                 ElevatedButton(
    //                   //if user click this button. user can upload image from camera
    //                   onPressed: () {
    //                     Navigator.pop(context);
    //                     getImage(ImageSource.camera);
    //                   },
    //                   child: const Row(
    //                     children: [
    //                       Icon(Icons.camera),
    //                       Text('From Camera'),
    //                     ],
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       });
    // }

    final _screenHeight = MediaQuery.of(context).size.height -
        kToolbarHeight -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text(
          "Profile Screen",
          style: TextStyle(color: Colors.black),
        ),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => const NotificationScreen()));
            },
            icon: const Icon(
              Icons.notifications_active_outlined,
              color: Colors.black54,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                  color: const Color(0xFF00C8B8).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8)),
              height: _screenHeight * 0.3,
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      const CircleAvatar(
                        radius: 64,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),

                      Container(
                        width: 36,
                        height: 36,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          child: const Icon(
                            Icons.camera_alt,
                            color: Color(0XFF00C8B8),
                          ),
                          //
                          onTap: () {
                            //child: imageFile==null ?
                            showModalBottomSheet(
                              context: context,
                              builder: (context) {
                                return Wrap(
                                  children: [
                                    ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          left: 20.0, bottom: 0.0),
                                      leading: const Icon(Icons.image),
                                      title: const Text('Select From Gallery'),
                                      onTap: () {
                                        _getFromGallery();
                                        // },
                                        // onTap: () async {
                                        //   image = await picker.pickImage(source: ImageSource.gallery);
                                        //   setState(() {
                                        //     //update UI
                                        //   });
                                      },

                                      // onPressed: getImage,
                                      // tooltip: 'Pick Image',
                                      // child: Icon(Icons.add_a_photo),
                                    ),
                                    ListTile(
                                      contentPadding: const EdgeInsets.only(
                                          left: 20.0, bottom: 35.0),
                                      // minVerticalPadding: 10,
                                      leading: const Icon(Icons.camera_alt),
                                      title: const Text('Select From Camera'),
                                      onTap: () {
                                        _getFromCamera();
                                      },
                                    ),
                                  ],
                                );
                              },
                              // ): Container(
                              //     child: Image.file(
                              // imageFile,
                              // fit: BoxFit.cover,
                              // ),
                            );
                          },
                          //popup_code
                          // onTap: () {
                          //   myAlert();
                          // },
                          // child: Text('Upload Photo'),
                          // onTap: ()=>_pickImage(),
                        ),
                      ),
                      // const SizedBox(
                      //    height: 10,
                      //  ),
                      //if image not null show the image
                      //if image null show text
                      // image != null
                      //     ? Padding(
                      //         padding:
                      //             const EdgeInsets.symmetric(horizontal: 20),
                      //         child: ClipRRect(
                      //           borderRadius: BorderRadius.circular(8),
                      //           child: Image.file(
                      //             //to show image, you type like this.
                      //             File(image!.path),
                      //             fit: BoxFit.cover,
                      //             width: MediaQuery.of(context).size.width,
                      //             height: 300,
                      //           ),
                      //         ),
                      //       )
                      //     : const Text(
                      //         "No Image",
                      //         style: TextStyle(fontSize: 20),
                      //       ),
                    ],
                  ),
                  const Text(
                    'John Smith',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'san Francisco, CA',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Color(0XFF1E1E1E),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF00C8B8).withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width * 0.6,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RichText(
                    textAlign: TextAlign.center,
                    text: const TextSpan(
                      style: TextStyle(
                        fontSize: 16,
                        color: Color(0XFF1E1E1E),
                      ),
                      children: [
                        TextSpan(
                          text: '+1 (415) 555 3890 \n',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0XFF1E1E1E),
                              fontSize: 18),
                        ),
                        TextSpan(
                          text: 'smith94@gmail.com',
                          style: TextStyle(
                              fontWeight: FontWeight.w300, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 10, top: 10),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color:
                    const Color.fromARGB(255, 211, 209, 209).withOpacity(0.4),
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const PersonalDetails()));
                    },
                    title: const Text(
                      "Personal Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("User Personal Details"),
                    trailing: const Icon(
                      Icons.arrow_forward_outlined,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const ChangePasswordScreen1()));
                    },
                    title: const Text(
                      "Privacy",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: const Text("Change And Update Password"),
                    trailing: const Icon(
                      Icons.arrow_forward_outlined,
                      size: 18,
                    ),
                  ),
                  ListTile(
                    onTap: () {},
                    title: const Text(
                      "Logout",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
            Container()
          ],
        ),
      ),
    );
  }

  _getFromGallery() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
      maxWidth: 180,
      maxHeight: 180,
    );
    if (pickedFile != null) {
      setState(() {
        File imageFile;
        imageFile = File(pickedFile.path);
      });
    }
  }

  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 180,
      maxHeight: 180,
    );
    if (pickedFile != null) {
      setState(() {
        File imageFile;
        imageFile = File(pickedFile.path);
      });
    }
  }


// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
// void main() => runApp(MaterialApp(
//   home: Home(),
//   debugShowCheckedModeBanner: false,
// ));
//
// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }
//
// class _HomeState extends State<Home> {
//
//   XFile? image;
//
//   final ImagePicker picker = ImagePicker();
//
//   //we can upload image from camera or from gallery based on parameter
//   Future getImage(ImageSource media) async {
//     var img = await picker.pickImage(source: media);
//
//     setState(() {
//       image = img;
//     });
//   }
//
//   //show popup dialog
//   void myAlert() {
//     showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape:
//             RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//             title: Text('Please choose media to select'),
//             content: Container(
//               height: MediaQuery.of(context).size.height / 6,
//               child: Column(
//                 children: [
//                   ElevatedButton(
//                     //if user click this button, user can upload image from gallery
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.gallery);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.image),
//                         Text('From Gallery'),
//                       ],
//                     ),
//                   ),
//                   ElevatedButton(
//                     //if user click this button. user can upload image from camera
//                     onPressed: () {
//                       Navigator.pop(context);
//                       getImage(ImageSource.camera);
//                     },
//                     child: Row(
//                       children: [
//                         Icon(Icons.camera),
//                         Text('From Camera'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload Image'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () {
//                 myAlert();
//               },
//               child: Text('Upload Photo'),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             //if image not null show the image
//             //if image null show text
//             image != null
//                 ? Padding(
//               padding: const EdgeInsets.symmetric(horizontal:

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Modal Bottom Sheet Demo',
//       home: Scaffold(
//         backgroundColor: Colors.blueGrey,
//         appBar: AppBar(
//           title: const Text('Creating a Modal Bottom Sheet'),
//           backgroundColor: Colors.black38,
//         ),
//         body: Builder(
//           builder: (context) {
//             return Center(
//               child: ElevatedButton(
//                 child: Text('Show Modal Bottom Sheet'),
//                 onPressed: () {
//                   showModalBottomSheet(
//                     context: context,
//                     builder: (context) {
//                       return Wrap(
//                         children: [
//                           ListTile(
//                             leading: Icon(Icons.share),
//                             title: Text('Share'),
//                           ),
//                           ListTile(
//                             leading: Icon(Icons.copy),
//                             title: Text('Copy Link'),
//                           ),
//                           ListTile(
//                             leading: Icon(Icons.edit),
//                             title: Text('Edit'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

// void setState(Null Function() param0) {
// }
}

// void _showPicker({
//   required BuildContext context,
// }) {
//   showModalBottomSheet(
//     context: context,
//     builder: (BuildContext context) {
//       return SafeArea(
//         child: Wrap(
//           children: <Widget>[
//             ListTile(
//               leading: const Icon(Icons.photo_library),
//               title: const Text('Photo Library'),
//               onTap: () {
//                 getImage(ImageSource.gallery);
//                 Navigator.of(context).pop();
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_camera),
//               title: const Text('Camera'),
//               onTap: () {
//                 getImage(ImageSource.camera);
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         ),
//       );
//     },
//   );
// }

// Future getImage(
//     ImageSource img,
//     ) async {
//   var picker;
//   final pickedFile = await picker.pickImage(source: img);
//   XFile? xfilePick = pickedFile;
//   setState(
//         () {
//       if (xfilePick != null) {
//         var galleryFile = File(pickedFile!.path);
//       } else {
//         ScaffoldMessenger.of(context as BuildContext).showSnackBar(// is this context <<<
//             const SnackBar(content: Text('Nothing is selected')));
//       }
//     },
//   );
// }
