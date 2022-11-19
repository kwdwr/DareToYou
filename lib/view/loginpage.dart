import 'package:daretoyouapp/view/signuppage.dart';
import 'package:daretoyouapp/view/recoverpassword.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'uygulamaiciekran.dart';
import '../core/service/i_auth_service.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final fbAuthService = Provider.of<IAuthService>(context,listen:false);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.flutter_dash,size: 75,),
                const SizedBox(height: 25,),
                Text(
                  'Dare To You',
                  style: GoogleFonts.bebasNeue(fontSize: 54),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Hoşgeldin!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'E-mail '
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: TextField(
                        controller: _passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            border: InputBorder.none, hintText: 'Şifre'
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                TextButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const RecoverPassword(),));
                },
                  child: const Text('Şifremi Unuttum',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 5),
                InkWell(splashColor: Colors.red,
                  onTap: () {
                   fbAuthService.signInEmailAndPassword(email: _emailController.text, password: _passwordController.text);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Uygulamaiciekran(),));
                  },
                  // padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Container(
                    width: 360,
                    height: 65,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(12)),
                    child: const Center(child: Text('Giris Yap',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Henüz üye değil misin?',style: TextStyle(fontWeight: FontWeight.bold)),
                    TextButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage(),));
                    },
                      child: const Text('Hemen Üye Ol',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

        ),
      ),
    );

  }
}
