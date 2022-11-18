//import 'package:daretoyouapp/view/Uygulamaiciekran.dart';
import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:daretoyouapp/view/LoginPage.dart';
//import 'package:daretoyouapp/view/recoverpassword.dart';
//import 'package:daretoyouapp/view/Uygulamaiciekran.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
//import '../firebase_options.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => RecoverPasswordState();
}


class RecoverPasswordState extends State<RecoverPassword> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final _authService = Provider.of<IAuthService>(context,listen:false);

    return Scaffold( backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.flutter_dash,size: 50,),
                  const SizedBox(height: 15,),
                  Text(
                    'Dare To You',
                    style: GoogleFonts.bebasNeue(fontSize: 54),
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
                      child:  Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) => email!=null &&!EmailValidator.validate(email)
                              ?'"E-posta adresiniz doğru gözükmüyor':null,
                          controller: _emailController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'E-Posta Adresi'
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(splashColor: Colors.red,
                    onTap: () async {
                      final isValid = formKey.currentState!.validate();
                      if(!isValid) {
                      }
                      else{
                        await  _authService.RecoverPassword(email: _emailController.text,);
                    //    Navigator.push(context, MaterialPageRoute(builder: (context) => const Uygulamaiciekran(),));
                        Alert(
                          context: context,
                          type: AlertType.success,
                          title: "Şifre Sıfırlama",
                          desc: "Şifre Sıfırlama bağlantınız E-posta adresinize gönderilmiştir.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Tamam",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context, MaterialPageRoute(builder: (context) => const LoginPage(),)),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      }

                    },
                    // padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: 360,
                      height: 65,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(12)),
                      child: const Center(child: Text('Sıfırlama Bağlantısı Gönder',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          )

        ),
      ),
    );
  }
}
