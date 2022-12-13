import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class RecoverPassword extends StatefulWidget {
  const RecoverPassword({Key? key}) : super(key: key);

  @override
  State<RecoverPassword> createState() => RecoverPasswordState();
}


class RecoverPasswordState extends State<RecoverPassword> {
  final formKey = GlobalKey<FormState>();
  late String title;
  late String desc;
  late AlertType type;
  final TextEditingController _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<IAuthService>(context,listen:false);

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
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) => email!=null &&!EmailValidator.validate(email)
                              ?'"E-posta adresiniz doğru gözükmüyor':null,
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'E-Posta Adresi'
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  InkWell(splashColor: Colors.red,
                    onTap: ()  {
                      final isValid = formKey.currentState!.validate();
                      if(!isValid) {
                      }
                      else {
                          authService.recoverPassword(email: _emailController
                              .text).then((value) {
                                title="Şifre Sıfırlama";
                                desc="Şifre Sıfırlama bağlantınız E-posta adresinize gönderilmiştir.";
                                type=AlertType.success;
                            buildAlert(title,desc,type).show();
                          }).catchError((e){
                            if(e.code == 'user-not-found'){
                              title ="Hata";
                              desc="Bu E-posta adresine bağlı bir kullanıcı bulunamadı.";
                              type=AlertType.error;
                              buildAlert(title, desc, type).show();
                            }
                            else if(e.code=='unauthorized-continue-uri'){
                              title ="Beklenmedik Hata 0001";
                              desc="Lütfen destek ekibiyle iletişime geçiniz: yedek309@outlook.com";
                              type=AlertType.error;
                              buildAlert(title, desc, type).show();
                            }
                            else if(e.code=='invalid-continue-uri'){
                              title ="Beklenmedik Hata 0002";
                              desc="Lütfen destek ekibiyle iletişime geçiniz: yedek309@outlook.com";
                              type=AlertType.error;
                              buildAlert(title, desc, type).show();
                            }
                            else if(e.code=='missing-ios-bundle-id'){
                              title ="Beklenmedik Hata 0003";
                              desc="Lütfen destek ekibiyle iletişime geçiniz: yedek309@outlook.com";
                              type=AlertType.error;
                              buildAlert(title, desc, type).show();
                            }
                            else if(e.code=='missing-continue-uri'){
                              title ="Beklenmedik Hata 0004";
                              desc="Lütfen destek ekibiyle iletişime geçiniz: yedek309@outlook.com";
                              type=AlertType.error;
                              buildAlert(title, desc, type).show();
                            }
                            else if(e.code=='missing-android-pkg-name'){
                              title ="Beklenmedik Hata 0005";
                              desc="Lütfen destek ekibiyle iletişime geçiniz: yedek309@outlook.com";
                              type=AlertType.error;
                              buildAlert(title, desc, type).show();
                            }
                            else if(e.code=='invalid-email'){
                              title ="Hata";
                              desc="E-posta adresiniz doğru gözükmüyor. Lütfen tekrar kontrol ediniz.";
                              type=AlertType.error;
                              buildAlert(title, desc, type).show();
                            }
                          });
                        }
                    },
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
    ],
  );
}
