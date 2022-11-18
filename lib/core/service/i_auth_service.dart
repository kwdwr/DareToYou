import 'package:daretoyouapp/core/model/user.dart';

abstract class IAuthService{
  Future<MyappUser> createEmailAndPassword(
      {required name,required surname, required String email,required phone, required String password});
  Future<void> RecoverPassword({required String email});
  Future<MyappUser> signInEmailAndPassword(
      {required String email,required String password});
  Future<void> SignOut();
  Stream<MyappUser?> get onAuthStateChanged;
}