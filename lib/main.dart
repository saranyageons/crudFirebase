import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onboarding_screen/crud/card.dart';
import 'package:onboarding_screen/crud/edit.dart';
import 'firebase/firebase_options.dart';
import 'crud/listview.dart';
import 'onboarding_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

// Fetch data from Firestore
// Future<void> getData() async {
//   QuerySnapshot querySnapshot =
//   await FirebaseFirestore.instance.collection('leads').get();
//   // Loop through documents and access data
//   querySnapshot.docs.forEach((document) {
//     print(document.data());
//   });
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     // home: list(),
     // routes: {
     //   Edit.routeName: (ctx) => Edit(),
     // },
      home: DataLoad(),
    );
  }
}
