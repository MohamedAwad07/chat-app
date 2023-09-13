import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var emailController = TextEditingController();
var passController = TextEditingController();
var userControllerReg = TextEditingController();
var emailControllerReg = TextEditingController();
var phoneControllerReg = TextEditingController();
var passControllerReg = TextEditingController();
Random random = Random();
int randomNumber = random.nextInt(1000000) + 1;
late AnimationController animationController;
bool isFrontVisible = true;
