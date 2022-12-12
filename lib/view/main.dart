import 'package:daretoyouapp/core/model/user.dart';
import 'package:daretoyouapp/core/widgets/auth_widget.dart';
import 'package:daretoyouapp/core/widgets/auth_widget_builder.dart';
import 'package:daretoyouapp/core/service/firebase_service.dart';
import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import '../firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:[
        Provider<IAuthService>(
          create: (_)=>AuthService(),
        ),
      ],
      child: AuthWidgetBuilder(
        onPageBuilder: (context,AsyncSnapshot<MyappUser?> snapshot)=> MaterialApp(
      title: 'Dare to You',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AuthWidget(snapshot: snapshot),
    ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
    );
  }

}
