import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:daretoyouapp/view/loginpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Uygulamaiciekran extends StatefulWidget {
  const Uygulamaiciekran({Key? key}) : super(key: key);

  @override
  State<Uygulamaiciekran> createState() => UygulamaiciekranState();
}
class UygulamaiciekranState extends State<Uygulamaiciekran> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<IAuthService>(context,listen: false);
    return Scaffold( backgroundColor: Colors.grey[300],
        body: SafeArea(
        child: Center(
        child: SingleChildScrollView(
         child: Column(
           children: [
           const Icon(Icons.flutter_dash,size: 75,),
          const SizedBox(height: 25,),
          Text(
            'Dare To You',
            style: GoogleFonts.bebasNeue(fontSize: 54),
          ),
          const SizedBox(height: 10),
           Text(
            'Hoşgeldin ${authService.getemail()}',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 50),
             const SizedBox(height: 10),
              Text(
               authService.getemail(),
               style: const TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 25,color: Colors.white
               ),
             ),
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
           ],
         ),
    ),
    ),
    ),
    );
  }
}