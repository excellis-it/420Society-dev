import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:groumally/feature/login/model/seller_login_res_model.dart';
import 'package:groumally/feature/profile/bloc/user_profile_bloc.dart';
import 'package:groumally/theme/app_decoration.dart';
import 'package:groumally/theme/app_style.dart';
import 'package:groumally/utils/image_constant.dart';
import 'package:groumally/utils/size_utils.dart';
import 'package:groumally/widgets/custom_image_view.dart';
import 'package:shimmer/shimmer.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class UserProfileScreen extends StatefulWidget {
  UserProfileScreen({Key? key}) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  File? image;
  Future pickImage({fromCamera = false}) async {
    try {
      final image = await ImagePicker().pickImage(
          source: fromCamera ? ImageSource.camera : ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserProfileBloc>(context).add(FetchProfileEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text("My Profile",
            style: TextStyle(fontSize: 20, color: Colors.black)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.notifications,
                color: Colors.black,
              ))
        ],
      ),
      body: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state is UserProfileLoadingState) {
            return Shimmer.fromColors(
              baseColor: Colors.transparent,
              highlightColor: Colors.white.withOpacity(0.3),
              child: Container(
                color: const Color(0xFF244661),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
              ),
            );
          } else if (state is UserProfileErrorState) {
            return Center(child: Text(state.errorMsg.toString()));
          } else if (state is UserProfileLoadedState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: double.maxFinite,
                  child: Container(
                    padding: getPadding(
                      left: 121,
                      top: 30,
                      right: 121,
                      bottom: 30,
                    ),
                    decoration: AppDecoration.fillGray900,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: CustomImageView(
                                imagePath: image == null
                                    ? ImageConstant.imgEllipse7
                                    : image?.path,
                                height: getSize(
                                  113,
                                ),
                                width: getSize(
                                  113,
                                ),
                                radius: BorderRadius.circular(
                                  getHorizontalSize(
                                    56,
                                  ),
                                ),
                              ),
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
                                onTap: () {
                                  print("hello in this ");
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Container(
                                        padding: EdgeInsets.only(
                                            top: 10,
                                            bottom: MediaQuery.of(context)
                                                .padding
                                                .bottom),
                                        child: Wrap(
                                          children: [
                                            const ListTile(
                                              title: Text('Choose From Source'),
                                            ),
                                            ListTile(
                                                leading: const Icon(
                                                    Icons.browse_gallery),
                                                title: const Text(
                                                    'Choose From Gallery'),
                                                onTap: () {
                                                  pickImage(fromCamera: false);
                                                  Navigator.of(context).pop();
                                                }),
                                            ListTile(
                                                leading: const Icon(
                                                    Icons.camera_alt),
                                                title: const Text(
                                                    'Choose From Camera'),
                                                onTap: () {
                                                  pickImage(fromCamera: true);
                                                  Navigator.of(context).pop();
                                                }),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: getPadding(
                            top: 12,
                          ),
                          child: Text(
                            "${state.profileModel.data?.details?.name}"
                                .toUpperCase(),
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: AppStyle.txtInterBold16,
                          ),
                        ),
                        Padding(
                          padding: getPadding(
                            top: 2,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomImageView(
                                svgPath: ImageConstant.imgStar,
                                height: getVerticalSize(
                                  17,
                                ),
                                width: getHorizontalSize(
                                  18,
                                ),
                              ),
                              Padding(
                                padding: getPadding(
                                  left: 4,
                                ),
                                child: Text(
                                  "4.84 (209.2K) ",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterLight14,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                    width: double.maxFinite,
                    child: Container(
                        width: getHorizontalSize(384),
                        margin: EdgeInsets.all(14),
                        padding: getPadding(
                            left: 26, top: 24, right: 26, bottom: 24),
                        decoration: AppDecoration.fillGray200.copyWith(
                            borderRadius: BorderRadiusStyle.roundedBorder6),
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              contentField(
                                  title: "shop owner name",
                                  subTitle:
                                      "${state.profileModel.data?.details?.name}"),
                              contentField(
                                  title: "shop name",
                                  subTitle:
                                      "${state.profileModel.data?.details?.shopName}"),
                              contentField(
                                  title: "shop address",
                                  subTitle:
                                      "${state.profileModel.data?.details?.shopAddress}"),
                              contentField(
                                  title: "Email",
                                  subTitle:
                                      "${state.profileModel.data?.details?.email}"),
                              contentField(
                                  title: "Phone number",
                                  subTitle:
                                      "${state.profileModel.data?.details?.name}"),
                              contentField(
                                  title: "password",
                                  subTitle: "********************"),
                            ]))),
              ],
            );
          }
          return Container();
        },
      ),
    );
  }

  Widget contentField({required String title, required String subTitle}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: getPadding(top: 11),
            child: Text(title.toUpperCase(),
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterBold12)),
        Padding(
            padding: getPadding(top: 2),
            child: Text(subTitle,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: AppStyle.txtInterLight16)),
      ],
    );
  }
}
