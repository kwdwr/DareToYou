import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/service/i_auth_service.dart';
import '../loginpage.dart';

class Settingspage extends StatefulWidget {
  const Settingspage({Key? key}) : super(key: key);

  @override
  State<Settingspage>  createState() => SettingspageState();
}

class SettingspageState extends State<Settingspage>{
  @override

  Widget build(BuildContext context){
    final authService = Provider.of<IAuthService>(context,listen: false);
    return Scaffold(backgroundColor: Colors.grey[300],
    body: SizedBox.expand(
    child: Container(
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    Colors.cyan,
    Color(0xFFB64355),
    ],
    )),
    child: SafeArea(
      child: SingleChildScrollView(
        child:Column(
          children: [
            InkWell(splashColor: Colors.red,
              onTap: (){
                authService.signOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
              },
              child: Container(
                width: 360,
                height: 65,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(12)),
                child: const Center(child: Text('Çıkış Yap',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text("Settings Page"),
          ],


        ),
    ),
    ),
    ),
    ),
    );

  }
}