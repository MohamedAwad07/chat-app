import 'package:bloc/bloc.dart';
import 'package:chat_app/models/UserModel.dart';
import 'package:chat_app/shared/Cubit/states.dart';
import 'package:chat_app/shared/constants/color_manager.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../constants/constants.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialStates());

  //method to get a object
  static AppCubit get(context) => BlocProvider.of(context);

  // Login page variables
  var formKey = GlobalKey<FormState>();
  bool isPassword = true;
  bool isChecked = false;

  // Register page variables
  var formKeyReg = GlobalKey<FormState>();
  bool isPasswordReg = true;
  bool isCheckedReg = false;

  // login page functions
  void checkedChange(bool value) {
    isChecked = value;
    emit(AppCheckedChangeState());
  }

  void passwordChange() {
    isPassword = !isPassword;
    emit(AppPasswordChangeState());
  }

  //Register page functions
  void checkedChangeReg(bool value) {
    isCheckedReg = value;
    emit(AppCheckedChangeRegState());
  }

  void passwordChangeReg() {
    isPasswordReg = !isPasswordReg;
    emit(AppPasswordChangeRegState());
  }

  void frontVisible() {
    isFrontVisible = !isFrontVisible;
    emit(AppFrontVisibleState());
  }

  void flipCard() {
    if (isFrontVisible) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    frontVisible();
  }

  void SignUp() async {
    emit(LoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailControllerReg.text.trim(),
            password: passControllerReg.text.trim())
        .then((value) {
      print(emailControllerReg.text);
      Fluttertoast.showToast(
        msg: "Registration done successfully ",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: ColorsManager.successMessage,
        textColor: ColorsManager.white,
        fontSize: 16.0,
        // webBgColor: ,
      );
      print('pass is ==>  ${passControllerReg.text.toString()}');
      userCreate(
        name: userControllerReg.text,
        email: emailControllerReg.text,
        phone: phoneControllerReg.text,
      );
      emit(AppSignUpSuccessState());
    }).catchError((error) {
      print('error ==>  ${error.toString()}');
      Fluttertoast.showToast(
        msg: "error",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: ColorsManager.errorMessage,
        textColor: ColorsManager.white,
        fontSize: 16.0,
      );
      emit(AppSignUpFailState());
    });
  }

  Future signIn() async {
    emit(LoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim())
        .then((value) {
      Fluttertoast.showToast(
        msg: "Sign in successfully",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: ColorsManager.successMessage,
        textColor: ColorsManager.white,
        fontSize: 16.0,
      );
      print("Success");
      getUserData();
      emit(AppSignInSuccessState());
    }).catchError((error) {
      Fluttertoast.showToast(
        msg: error.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: ColorsManager.errorMessage,
        textColor: ColorsManager.white,
        fontSize: 16.0,
      );
      print('error is :  ${error.toString()}');
    });
    emit(AppSignInFailState());
    //  Navigator.of(context).pushNamed('A');
  }

  void userCreate({
    required String name,
    required String email,
    required String phone,
  }) {
    UserModel model = UserModel(name: name, email: email, phone: phone);
    print('Counter before use : ${randomNumber.toString()}');
    FirebaseFirestore.instance
        .collection('users')
        .doc("1")
        .set(model.toMap())
        .then((value) => {
              randomNumber++,
              emit(AppCreateUserSuccessState()),
            })
        .catchError((error) {
      emit(AppCreateUserFailState());
    });
  }

  void getUserData() {
    DocumentSnapshot<Map<String , dynamic>> test;
    UserModel userData;
    FirebaseFirestore.instance
        .collection('users')
        .doc("1")
        .get()
        .then((value) => {
      print(value.data()),
      emit(AppGetUserDataSuccessState()),
    })
        .catchError((error) {
          print('error is  : ${error.toString()}');
      emit(AppGetUserDataFailState());
    });
  }
}
