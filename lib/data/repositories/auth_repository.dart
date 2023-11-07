
// import 'package:book_reader/model/universal_data.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:book_reader/data/firebase/auth_service.dart';
// import 'package:book_reader/model/user_model.dart';
// import '../storage_repository/local_db.dart';

// class AuthRepository {
//   final AuthService authService;
//   late final UserCredential userCredential;

//   AuthRepository({
//     required this.authService,
//   });

//   Future<UniversalData> registerUser({required UserModel userModel}) async {
//     return authService.signUpUser(
//         email: userModel.email, password: userModel.password);
//   }

//   Future<UniversalData> loginUser(
//       {required String email, required String password}) async {
//     return authService.logInUser(email: email, password: password);
//   }

//   Future<UniversalData> logOutUser() async {
//     return authService.logOutUser();
//   }

//   bool isStart() => StorageRepository.getBool("isStart");

//   Future<void> setBool() async =>
//       await StorageRepository.putBool("isStart", true);

//   String get getToken => StorageRepository.getString('token');

//   Future<void> setToken({required String token}) async =>
//       StorageRepository.putString('token', token);

//   Future<bool?> deleteToken() async => StorageRepository.deleteString('token');
  
// }
