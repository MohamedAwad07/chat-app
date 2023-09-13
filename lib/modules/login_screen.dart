import 'package:chat_app/shared/constants/color_manager.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../shared/Cubit/cubit.dart';
import '../shared/Cubit/states.dart';
import '../shared/components/components.dart';
import '../shared/constants/constants.dart';

Widget login() {
  return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
           // backgroundColor:Colors.white,
            body: SingleChildScrollView(
              child: Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        top: 150.0,
                        bottom: 50.0,

                      ),
                      child: Text(
                        'Log in',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontFamily: 'LilitaOne',
                          color: ColorsManager.brown,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    //username
                    defaultTextFormField(
                      label: 'Email',
                      controller: emailController,
                      validate: (value) {
                        if (value?.isEmpty == true) {
                          return 'Email must not be empty';
                        } else if ((value?.length ?? 0) < 6) {
                          return 'Very short Email';
                        }
                        return null;
                      },
                      prefix: Icons.person_outline,
                      keyboard: TextInputType.emailAddress,
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    //password
                    defaultTextFormField(
                      label: 'Password',
                      controller: passController,
                      validate: (value) {
                        if (value?.isEmpty == true) {
                          return 'Password must not be empty';
                        } else if ((value?.length ?? 0) < 6) {
                          return 'Very short password';
                        }
                        return null;
                      },
                      prefix: Icons.lock_outline_rounded,
                      isObscure: cubit.isPassword,
                      keyboard: TextInputType.visiblePassword,
                      obscure: () {
                        cubit.passwordChange();
                      },
                      sufIcon: cubit.isPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                        start: 14.0,
                      ),
                      child: CheckboxListTile(
                        title: const Text("Remember me"),
                        value: cubit.isChecked,
                        onChanged: (bool? value) {
                          cubit.checkedChange(value ?? false);
                        },
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    const SizedBox(
                      height: 60.0,
                    ),
                    // Login button
                    ConditionalBuilder(
                      condition: state is! LoadingState,
                     builder: (context) => defaultMaterialButton(
                       valid: () {
                         if (cubit.formKey.currentState!.validate()) {
                           cubit.signIn();
                         }
                       },
                       text: 'Login',
                       textColor: ColorsManager.white,
                       haveBorder: true,
                       containerColor: ColorsManager.amber,
                     ),
                      fallback: (BuildContext context) => Center(child: CircularProgressIndicator()),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Does not have account?...',
                          style: TextStyle(
                            color: ColorsManager.brown,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              cubit.flipCard();
                            },
                            child: const Text(
                              'Sign up',
                              style: TextStyle(color: ColorsManager.amber,),
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
