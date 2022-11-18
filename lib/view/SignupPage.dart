import 'package:daretoyouapp/view/LoginPage.dart';
import 'package:daretoyouapp/view/Uygulamaiciekran.dart';
import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:daretoyouapp/view/SignupPage.dart';
import 'package:daretoyouapp/view/Uygulamaiciekran.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../firebase_options.dart';
import 'package:email_validator/email_validator.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => SignUpPageState();

}


class SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _password2Controller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surNameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool? check1 = false;
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
                  const Text(
                    'Hoşgeldin!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Ad'
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
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextField(
                          controller: _surNameController,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Soyad'
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

                 // Padding(
              //      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                 //   child: Container(
                 //     decoration: BoxDecoration(
                 //         color: Colors.grey[200],
                  //        border: Border.all(color: Colors.white),
                 //         borderRadius: BorderRadius.circular(12)
                 //     ),
                 //     child:  Padding(
                 //       padding: EdgeInsets.only(left: 20.0),
                  //      child: TextField(
                 //         controller: _phoneController,
                   //       decoration: InputDecoration(
                 //             border: InputBorder.none, hintText: 'Telefon Numarası'
                  //        ),
                 //       ),
                //      ),
                //    ),
               //   ),

               //   const SizedBox(height: 10),
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
                          validator: (value) => value!=null && value.length <6
                              ?'"Şifreniz 6 karakterden küçük olamaz':null,
                          controller: _passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Şifre'
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
                      child:  Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (password2) => password2!=null && password2!=_passwordController.text
                              ?'"Şifreniz aynı olmalı':null,
                          controller: _password2Controller,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none, hintText: 'Şifre Doğrulama'
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: IntlPhoneField(
                    decoration: InputDecoration(
                      labelText: 'Telefon Numarası',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.red),
                      ),
                    ),
                    initialCountryCode: 'TR',
                    onChanged: (phone) {
                      controller: _phoneController;
                    },
                  ),
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    value: check1, //set variable for value
                    onChanged: (bool? value){
                      setState(() {
                        check1 = value;
                      });
                    },
                    title: Text('Kullanım koşullarını kabul ediyorum.',style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),



                  InkWell(splashColor: Colors.red,
                    onTap: () async {
                      final isValid = formKey.currentState!.validate();
                      if(!isValid) {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Üye Ol",
                          desc: "Bilgilerinizi tekrar kontrol ediniz...",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Tamam",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      }
                      else if(check1==false){
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Üye Ol",
                          desc: "Lütfen kullanım koşullarını kabul ediniz.",
                          buttons: [
                            DialogButton(
                              child: Text(
                                "Tamam",
                                style: TextStyle(color: Colors.white, fontSize: 20),
                              ),
                              onPressed: () => Navigator.pop(context),
                              gradient: LinearGradient(colors: [
                                Color.fromRGBO(116, 116, 191, 1.0),
                                Color.fromRGBO(52, 138, 199, 1.0)
                              ]),
                            )
                          ],
                        ).show();
                      }
                      else{
                        await  _authService.createEmailAndPassword(name:_nameController.text,surname:_surNameController.text,email: _emailController.text,phone:_phoneController.text, password: _passwordController.text);
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));

                      }

                    },
                    // padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: 360,
                      height: 65,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(color: Colors.deepPurple,borderRadius: BorderRadius.circular(12)),
                      child: const Center(child: Text('Üye Ol',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),),
                      ),
                    ),
                  ),

                //  Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
                  //    children: [
                  //     const Text('Henüz üye değil misiniz?',style: TextStyle(fontWeight: FontWeight.bold)),
    //     TextButton(onPressed: (){
    //      Navigator.push(context, MaterialPageRoute(builder: (context) => const Uygulamaiciekran(),));
              //     },
              //   child: const Text('Hemen Üye Ol',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),
              //    ),
                  //    ),
              //    ],
                  //    ),
                ],
              ),
            ),

          ),
        ),
      ),
    );
  }
}
