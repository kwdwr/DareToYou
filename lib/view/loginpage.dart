import 'package:daretoyouapp/view/signuppage.dart';
import 'package:daretoyouapp/view/recoverpassword.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
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
  late String title;
  late String desc;
  late AlertType type;
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
                textBoxBuilder("E-mail",_emailController,false),
                const SizedBox(height: 10),
                textBoxBuilder("Şifre", _passwordController,true),
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
                    if (_emailController.text != "" &&
                        _passwordController.text != "") {
                      fbAuthService.signInEmailAndPassword(
                          email: _emailController.text,
                          password: _passwordController.text).then((value) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Uygulamaiciekran(),));
                      }).catchError((e) {
                        if (e.code == 'invalid-email') {
                          title = "Hatalı E-mail";
                          desc =
                          "E-mail adresiniz hatalı. Lütfen kontrol ediniz.";
                          type = AlertType.error;
                          buildAlert(title, desc, type).show();
                        }
                        else if (e.code == 'user-disabled') {
                          title = "Yasaklı Kullanıcı";
                          desc =
                          "Bu kullanıcı sistemde yasaklanmıştır. Lütfen destek ekibi ile iletişime geçiniz. yedek309@outlook.com";
                          type = AlertType.error;
                          buildAlert(title, desc, type).show();
                        }
                        else if (e.code == 'user-not-found') {
                          title = "Kullanıcı Bulunamadı";
                          desc =
                          "Bu E-posta adresine bağlı bir kullanıcı bulunamadı. Lütfen E-posta adresinizi kontrol ediniz.";
                          type = AlertType.error;
                          buildAlert(title, desc, type).show();
                        }
                        else if (e.code == 'wrong-password') {
                          title = "Şifreniz Hatalı";
                          desc =
                          "Şifreniz hatalı. Lütfen tekrar deneyiniz. Eğer şifrenizi hatırlamıyor iseniz, Şifremi unuttum butonuna tıklayabilirsiniz.";
                          type = AlertType.error;
                          buildAlert(title, desc, type).show();
                        }
                      });
                    }
                    else{
                      title = "Hata";
                      desc = "Lütfen E-posta adresi ve şifrenizi giriniz.";
                      type = AlertType.error;
                      buildAlert(title, desc, type).show();
                    }
                  },
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
  Padding textBoxBuilder(String label,TextEditingController controller,bool obsecure)=> Padding(
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
          controller: controller,
          obscureText: obsecure,
          decoration:  InputDecoration(
              border: InputBorder.none, hintText: label,
          ),
        ),
      ),
    ),);
  Alert buildAlert(String title,String desc,var type)=>Alert(
    context: context,
    type: type,
    title: title,
    desc: desc,
    buttons: [
      DialogButton(
        onPressed: () => Navigator.pop(context),
        gradient: const LinearGradient(colors: [
          Color.fromRGBO(116, 116, 191, 1.0),
          Color.fromRGBO(52, 138, 199, 1.0)
        ]),
        child: const Text(
          "Tamam",
          style: TextStyle(
              color: Colors.white, fontSize: 20),
        ),
      )
    ],);
}
