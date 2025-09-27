import 'package:drishtitech/features/auth/pages/signup_page.dart';
import 'package:drishtitech/features/auth/providers/auth_provider.dart';
import 'package:drishtitech/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
          providers: [ChangeNotifierProvider(create: (_) => AuthProvider())],
          child: SignupPage()),
    );
  }
}
