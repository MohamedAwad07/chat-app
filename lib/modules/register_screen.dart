import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/Cubit/cubit.dart';
import '../shared/Cubit/states.dart';
import '../shared/components/components.dart';
import '../shared/constants/color_manager.dart';
import '../shared/constants/constants.dart';

Widget register() {
  return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // if(state is AppCreateUserSuccessState)
          //   {
          //     Navigator.pushReplacement(context,
          //         MaterialPageRoute(builder: (context) => Home()));
          //   }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubitReg = AppCubit.get(context);
          return Scaffold(
            //   backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: cubitReg.formKeyReg,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 100.0,
                        bottom: 50.0,
                      ),
                      child: Text(
                        'Create Account',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //username
                    defaultTextFormField(
                      context: context,
                      label: 'Username',
                      controller: userControllerReg,
                      validate: (value) {
                        if (value?.isEmpty == true) {
                          return 'Username must not be empty';
                        } else if ((value?.length ?? 0) < 4) {
                          return 'Very short Username';
                        }
                        return null;
                      },
                      prefix: Icons.person_outline,
                      keyboard: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    // email
                    defaultTextFormField(
                      context: context,
                      label: 'Email',
                      controller: emailControllerReg,
                      validate: (value) {
                        if (value?.isEmpty == true) {
                          return 'Email must not be empty';
                        } else if ((value?.length ?? 0) < 6) {
                          return 'Very short Email';
                        }
                        return null;
                      },
                      prefix: Icons.email_outlined,
                      keyboard: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    //password
                    defaultTextFormField(
                      context: context,
                      label: 'Password',
                      controller: passControllerReg,
                      validate: (value) {
                        if (value?.isEmpty == true) {
                          return 'Password must not be empty';
                        } else if ((value?.length ?? 0) < 6) {
                          return 'Very short password';
                        }
                        return null;
                      },
                      prefix: Icons.lock_outline_rounded,
                      isObscure: cubitReg.isPasswordReg,
                      keyboard: TextInputType.visiblePassword,
                      obscure: () {
                        cubitReg.passwordChangeReg();
                      },
                      sufIcon: cubitReg.isPasswordReg
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    defaultTextFormField(
                      context: context,
                      label: 'Phone',
                      controller: phoneControllerReg,
                      validate: (value) {
                        if (value?.isEmpty == true) {
                          return 'Phone must not be empty';
                        } else if ((value?.length ?? 0) != 11) {
                          return 'invalid Numbers count';
                        }
                        return null;
                      },
                      prefix: Icons.phone,
                      keyboard: TextInputType.phone,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 14.0,
                      ),
                      child: CheckboxListTile(
                        title: const Text("Remember me"),
                        value: cubitReg.isCheckedReg,
                        onChanged: (bool? value) {
                          cubitReg.checkedChangeReg(value ?? false);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    const SizedBox(
                      height: 50.0,
                    ),
                    // sign up button
                    ConditionalBuilder(
                      condition: state is! LoadingState,
                      builder: (context) => defaultMaterialButton(
                        valid: () {
                          if (cubitReg.formKeyReg.currentState!.validate()) {
                            cubitReg.SignUp();
                          }
                        },
                        text: 'Sign up',
                        textColor: ColorsManager.white,
                        haveBorder: true,
                        containerColor: ColorsManager.amber,
                      ),
                      fallback: (BuildContext context) =>
                          Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    // sign up with google button

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          'already have account?...',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        TextButton(
                            onPressed: () {
                              cubitReg.flipCard();
                            },
                            child: const Text(
                              'Log in',
                              style: TextStyle(
                                color: ColorsManager.amber,
                              ),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ));
}
