import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:daretoyouapp/view/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Uygulamaiciekran extends StatefulWidget {
  const Uygulamaiciekran({Key? key}) : super(key: key);

  @override
  State<Uygulamaiciekran> createState() => UygulamaiciekranState();
}

class UygulamaiciekranState extends State<Uygulamaiciekran> {
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<IAuthService>(context,listen: false);
    return Scaffold( backgroundColor: Colors.blueGrey,
        body: SafeArea(
        child: Center(
        child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             const SizedBox(height: 10),
             const Text(
               'E-mail Doğrulanmamış!',
               style: TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 25,color: Colors.white
               ),
             ),
             InkWell(splashColor: Colors.red,
               onTap: () async {
                await _authService.SignOut();
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));
               },
               // padding: const EdgeInsets.symmetric(horizontal: 25.0),
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
           ],
         ),
    ),
    ),
    ),
    );
  }
}