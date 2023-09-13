import 'package:bloc/bloc.dart';
import 'package:chat_app/modules/flip_test.dart';
import 'package:chat_app/shared/Cubit/cubit.dart';
import 'package:chat_app/shared/Cubit/states.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyBIdvD1TxmEfdMialZIV36Qf6TcDJCuKfo",
        authDomain: "chat-app-7fa73.firebaseapp.com",
        projectId: "chat-app-7fa73",
        storageBucket: "chat-app-7fa73.appspot.com",
        messagingSenderId: "788342188841",
        appId: "1:788342188841:web:5721325790e5400824a538",
        //1:788342188841:android:440751f2ce567fcd24a538 for android
        measurementId: "G-ZPWYVF88N5"),
  );
  Bloc.observer = MyBlocObserver();
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: FlipableCardDemo(),
          );
        },
      ),
    );
  }
}
