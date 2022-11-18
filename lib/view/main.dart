import 'package:daretoyouapp/core/model/user.dart';
import 'package:daretoyouapp/core/widgets/auth_widget.dart';
import 'package:daretoyouapp/core/widgets/auth_widget_builder.dart';
import 'package:daretoyouapp/view/SignupPage.dart';
import 'package:daretoyouapp/view/Uygulamaiciekran.dart';
import 'package:daretoyouapp/core/service/firebase_service.dart';
import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:daretoyouapp/view/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
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
  final EmailController = TextEditingController();
  final PasswordController = TextEditingController();
  @override
  void dispose(){
    EmailController.dispose();
    PasswordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.flutter_dash,size: 75,),
            SizedBox(height: 25,),
              Text(
                'Dare To You',
                style: GoogleFonts.bebasNeue(fontSize: 54),
              ),
              const SizedBox(height: 10),
              TextButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
              },
                child: const Text(
                'Hoşgeldin!',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
      ),
    );
    Future SignIn() async {

    }
  }

}
