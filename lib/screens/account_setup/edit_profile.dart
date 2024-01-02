// ignore_for_file: use_build_context_synchronously, must_be_immutable, unrelated_type_equality_checks

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cinema_app/app/app_theme.dart';
import 'package:flutter_cinema_app/generated/l10n.dart';
import 'package:flutter_cinema_app/model/user_model.dart';
import 'package:flutter_cinema_app/provider/movie_provider.dart';
import 'package:flutter_cinema_app/provider/provider.dart';
import 'package:flutter_cinema_app/resource/fonts/app_fonts.dart';
import 'package:flutter_cinema_app/resource/images/app_images.dart';
import 'package:flutter_cinema_app/utils/app_function.dart';
import 'package:flutter_cinema_app/widgets/app_button.dart';
import 'package:flutter_cinema_app/widgets/app_datetime_pcker.dart';
import 'package:flutter_cinema_app/widgets/custom_dialog.dart';
import 'package:flutter_cinema_app/widgets/dropdown_widget.dart';
import 'package:flutter_cinema_app/widgets/textformfield_setup_profile.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_cinema_app/provider/user.dart';
import '../../network/api_request.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final ImagePicker _picker = ImagePicker();

  File? image;

  DateTime? selectedDateTime;

  TextEditingController dateOfBirthController = TextEditingController();

  TextEditingController numberPhoneController = TextEditingController();

  TextEditingController fullNameController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController addressController = TextEditingController();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var userinfor = Provider.of<MovieProvider>(context, listen: false).user;
    numberPhoneController.text = userinfor.phoneNumber ?? "";
    fullNameController.text = userinfor.name ?? "";
    addressController.text = userinfor.address ?? "";
    dateOfBirthController.text = userinfor.birth!;
    if (userinfor.birth != null) {
      selectedDateTime =
          DateFormat("yyyy-MM-dd").parse(userinfor.birth ?? "0000-00-00");
    } else {
      selectedDateTime = null;
    }

    genderController.text = userinfor.gender == 1
        ? S.of(context).male
        : (userinfor.gender == 2 ? S.of(context).female : S.of(context).other);
  }

  @override
  Widget build(BuildContext context) {
    var data = Provider.of<MovieProvider>(context);

    return Consumer2<User, LanguageProvider>(
        builder: (context, userData, languageProvider, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: AppTheme.blackGradient,
        ),
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(20.w),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(
                            image: const AssetImage(AppImages.buttonBack),
                            width: 40.w,
                            height: 40.w,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(S.of(context).profile,
                            // textAlign: TextAlign.center,
                            style: AppFonts.poppins700(20.sp, AppTheme.white)),
                        Image(
                          image: const AssetImage(AppImages.buttonLocation),
                          width: 40.w,
                          height: 40.w,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Stack(children: [
                      userData.avatar,
                      Positioned(
                        bottom: 0,
                        right: 23.w,
                        child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(25.w),
                                    ),
                                  ),
                                  builder: (BuildContext context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SizedBox(
                                          height: 10.w,
                                        ),
                                        Container(
                                          width: 100.w,
                                          height: 5.w,
                                          decoration: BoxDecoration(
                                            color: const Color(0xff000000)
                                                .withOpacity(0.5),
                                            borderRadius:
                                                BorderRadius.circular(100.w),
                                          ),
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.only(
                                              top: 20.w,
                                              bottom: 20.w,
                                              left: 30.w,
                                              right: 30.w),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              InkWell(
                                                onTap: () async {
                                                  final XFile? photo =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  if (photo != null) {
                                                    image = File(photo.path);
                                                    userData.updateImage(
                                                        image, context);
                                                    Provider.of<MovieProvider>(
                                                            context,
                                                            listen: false)
                                                        .uploadImage(context,
                                                            userData.imagePath);
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons.camera_alt,
                                                      size: 25.w,
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                    ),
                                                    SizedBox(
                                                      width: 20.w,
                                                    ),
                                                    Text(
                                                      S.of(context).take,
                                                      style:
                                                          AppFonts.poppins500(
                                                              15.sp,
                                                              Colors.black
                                                                  .withOpacity(
                                                                      0.5)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15.w,
                                              ),
                                              InkWell(
                                                onTap: () async {
                                                  final XFile? photo =
                                                      await _picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  if (photo != null) {
                                                    image = File(photo.path);
                                                    userData.updateImage(
                                                        image, context);
                                                    Provider.of<MovieProvider>(
                                                            context,
                                                            listen: false)
                                                        .uploadImage(context,
                                                            userData.imagePath);
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(
                                                      Icons
                                                          .photo_library_rounded,
                                                      size: 25.w,
                                                      color: Colors.black
                                                          .withOpacity(0.5),
                                                    ),
                                                    SizedBox(
                                                      width: 20.w,
                                                    ),
                                                    Text(
                                                      S.of(context).gallery,
                                                      style:
                                                          AppFonts.poppins500(
                                                              15.sp,
                                                              Colors.black
                                                                  .withOpacity(
                                                                      0.5)),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Image(
                              image: const AssetImage(AppImages.iconEdit),
                              width: 35.w,
                              height: 35.w,
                              fit: BoxFit.fill,
                            )),
                      ),
                    ]),
                    SizedBox(
                      height: 27.w,
                    ),
                    TextFormmFieldToSetupProfile(
                      title: S.of(context).fullName,
                      textController: fullNameController,
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: AppDateTimeButton(
                            dateTimeText: selectedDateTime,
                            labelText: S.of(context).dateOfBirth,
                            icon: "Calendar",
                            onDateTimeChanged: (DateTime value) {
                              selectedDateTime = value;
                              dateOfBirthController.text =
                                  DateFormat("yyyy-MM-dd").format(value);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 20.w,
                        ),
                        Expanded(
                          child: AppDropDownButton(
                            selectedValue: genderController.text,
                            hintText: S.of(context).gender,
                            items: [
                              S.of(context).male,
                              S.of(context).female,
                              S.of(context).other
                            ],
                            onChanged: (value) {
                              genderController.text = value;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    TextFormmFieldToSetupProfile(
                      title: S.of(context).address,
                      textController: addressController,
                    ),
                    SizedBox(
                      height: 20.w,
                    ),
                    TextFormmFieldToSetupProfile(
                      title: S.of(context).hintPhone,
                      textController: numberPhoneController,
                    ),
                    SizedBox(
                      height: 26.w,
                    ),
                    InkWell(
                        onTap: () async {
                          if (fullNameController.text.trim() == "" ||
                              genderController.text.trim() == "" ||
                              addressController.text.trim() == "" ||
                              dateOfBirthController.text.trim() == "" ||
                              numberPhoneController.text.trim() == '') {
                            showMyDialog(context,
                                title: S.of(context).incompletion,
                                content: S.of(context).please,
                                noButton: true);
                          } else {
                            AppFunction.showLoading(context);
                            Response? res = await ApiRequest.updateUser(
                              avatar: data.urlImage,
                              dateOfBirth: dateOfBirthController.text.trim(),
                              name: fullNameController.text.trim(),
                              address: addressController.text.trim(),
                              phone: numberPhoneController.text.trim(),
                              gender: (genderController.text == "Nam" ||
                                      genderController.text == "Male")
                                  ? 1
                                  : ((genderController.text == "Nữ" ||
                                          genderController.text == "Female")
                                      ? 2
                                      : 3),
                              url: "user/update-user",
                            );
                            if (res.data["status"] == 0) {
                              AppFunction.hideLoading(context);
                              data.userUpdate =
                                  UserModel.fromJson(res.data["userInfo"]);
                              showMyDialog(context,
                                  title: "Thông báo",
                                  content:
                                      "Cập nhật thông tin tài khoản thành công",
                                  noButton: false,
                                  buttonOneText: "Xác nhận",
                                  onPressButtonOne: () {
                                Navigator.pop(context, true);
                              });
                            }
                          }
                        },
                        child: const AppButton(
                          titleButton: "Cập nhật",
                          flex: 0.5,
                        )),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();

    addressController.dispose();
    fullNameController.dispose();
    numberPhoneController.dispose();
    dateOfBirthController.dispose();
    genderController.dispose();
  }
}
