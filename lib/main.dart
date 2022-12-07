import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:device_shop/data/repositories/auth_repository.dart';
import 'package:device_shop/screens/auth/auth_page.dart';
import 'package:device_shop/screens/tab_box.dart';
import 'package:device_shop/view_model/auth_view_model.dart';
import 'package:device_shop/view_model/categories_view_model.dart';
import 'package:device_shop/view_model/tab_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/repositories/categories_repository.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabViewModel()),
        ChangeNotifierProvider(
            create: (context) => CategoriesViewModel(
                    categoryRepository: CategoryRepository(
                  firebaseFirestore: FirebaseFirestore.instance,
                ))),
        Provider(
            create: (context) => AuthViewModel(
                authRepository:
                    AuthRepository(firebaseAuth: FirebaseAuth.instance)))
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, AsyncSnapshot<User?> snapshot) {
          if (snapshot.hasData) {
            return const TabBox();
          } else {
            return const AuthPage();
          }
        });
  }
}