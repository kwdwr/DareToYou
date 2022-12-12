import 'package:daretoyouapp/core/service/i_auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
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
  late String phoneController;
  bool? check1 = false;
  late String title;
  late String desc;
  late AlertType type;
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<IAuthService>(context, listen: false);

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.flutter_dash,
                    size: 50,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
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
                  textBoxBuilder("Ad", _nameController),
                  const SizedBox(height: 10),
                  textBoxBuilder("Soyad", _surNameController),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                              email != null && !EmailValidator.validate(email)
                                  ? '"E-posta adresiniz doğru gözükmüyor'
                                  : null,
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'E-Posta Adresi'),
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
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? '"Şifreniz 6 karakterden küçük olamaz'
                                  : null,
                          controller: _passwordController,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none, hintText: 'Şifre'),
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
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (password2) => password2 != null &&
                                  password2 != _passwordController.text
                              ? '"Şifreniz aynı olmalı'
                              : null,
                          controller: _password2Controller,
                          obscureText: true,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Şifre Doğrulama'),
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
                          borderRadius: BorderRadius.circular(12)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0,top: 8.0,right: 8),
                    child: IntlPhoneField(
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                        counter:  const Offstage(),
                        labelText: 'Telefon Numarası',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: const BorderSide(color: Colors.red),
                        ),
                      ),
                      initialCountryCode: 'TR',
                      onChanged: (phone) {
                        phoneController = phone.completeNumber;
                      },
                    ),
                  ),
                  ),
                  ),
                  const SizedBox(height: 10),
                  CheckboxListTile(
                    value: check1, //set variable for value
                    onChanged: (bool? value) {
                      setState(() {
                        check1 = value;
                      });
                    },
                    title: const Text('Kullanım koşullarını kabul ediyorum.',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(height: 10),

                  InkWell(
                    splashColor: Colors.red,
                    onTap: () {
                      final isValid = formKey.currentState!.validate();
                      if (!isValid) {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Üye Ol",
                          desc: "Bilgilerinizi tekrar kontrol ediniz...",
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
                        ).show();
                      } else if (check1 == false) {
                        Alert(
                          context: context,
                          type: AlertType.error,
                          title: "Üye Ol",
                          desc: "Lütfen kullanım koşullarını kabul ediniz.",
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
                        ).show();
                      } else {
                        authService.createEmailAndPassword(
                            name: _nameController.text,
                            surname: _surNameController.text,
                            email: _emailController.text,
                            phone: phoneController,
                            password: _passwordController.text).then((value) {
                          Navigator.pop(context);
                        }).catchError((e){
                          if(e.code == 'email-already-in-use'){
                            title ="Hata";
                            desc="Bu E-posta adresine bağlı bir hesap zaten var.";
                            type=AlertType.error;
                            buildAlert(title, desc, type).show();
                          }
                          else if(e.code == 'invalid-email'){
                            title ="Hata";
                            desc="Bu E-posta adresi doğru gözükmüyor.";
                            type=AlertType.error;
                            buildAlert(title, desc, type).show();
                          }
                          else if(e.code == 'operation-not-allowed'){
                            title ="Hata 0006";
                            desc="Lütfen destek ekibiyle iletişime geçiniz: yedek309@outlook.com";
                            type=AlertType.error;
                            buildAlert(title, desc, type).show();
                          }
                          else if(e.code == 'weak-password'){
                            title ="Hata";
                            desc="Şifreniz kolay gözüküyor. Lütfen en az 6 karakterli daha zor bir şifre seçiniz.";
                            type=AlertType.error;
                            buildAlert(title, desc, type).show();
                          }
                        });

                      }
                    },
                    // padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      width: 360,
                      height: 65,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(12)),
                      child: const Center(
                        child: Text(
                          'Üye Ol',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
    ],);
  Padding textBoxBuilder(String label,TextEditingController controller)=> Padding(
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
          decoration:  InputDecoration(
            border: InputBorder.none, hintText: label,
          ),
        ),
      ),
    ),);
}
