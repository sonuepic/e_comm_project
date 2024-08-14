import 'package:e_comm_project/controller/auth_provider.dart';
import 'package:e_comm_project/controller/product_provider.dart';
import 'package:e_comm_project/controller/remote_config_provider.dart';
import 'package:e_comm_project/firebase_options.dart';
import 'package:e_comm_project/view/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
        ChangeNotifierProvider(create: (_) => RemoteConfigProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    );
  }
}
//  1:356595617520:android:edb3303db5cadd4a453c35