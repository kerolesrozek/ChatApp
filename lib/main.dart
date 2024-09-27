import 'package:chatapp/firebase_options.dart';
import 'package:chatapp/views/chatview.dart';
import 'package:chatapp/views/loginview.dart';
import 'package:chatapp/views/registerview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  const ChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        RegisterView.id: (context) => RegisterView(),
        LoginView.id: (context) => LoginView(),
        Chatview.id:(context)=>Chatview()
      },
      home: LoginView(),
    );
  }
}
