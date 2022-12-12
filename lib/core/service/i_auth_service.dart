import 'package:daretoyouapp/core/model/user.dart';

abstract class IAuthService{
  Future<MyappUser> createEmailAndPassword(
      {required name,required surname, required String email,required phone, required String password});
  Future<void> recoverPassword({required String email});
  Future<MyappUser> signInEmailAndPassword(
      {required String email,required String password});
  Future<void> signOut();
  Stream<MyappUser?> get onAuthStateChanged;
  String getemail();
}