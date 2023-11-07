// import 'package:book_reader/model/universal_data.dart';
// import 'package:book_reader/model/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';

// class AuthService {
//   Future<UniversalData> signUpUser(
//       {required String email, required String password}) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       return UniversalData(data: userCredential);
//     } on FirebaseException catch (e) {
//       return UniversalData(error: e.code);
//     } catch (e) {
//       return UniversalData(error: e.toString());
//     }
//   }

//   Future<UniversalData> addUser({required UserModel userModel}) async {
//     try {
//       DocumentReference newUser = await FirebaseFirestore.instance
//           .collection('users')
//           .add(userModel.toJson() as Map<String, dynamic>);
//       await FirebaseFirestore.instance
//           .collection('users')
//           .doc(newUser.id)
//           .update({'userId': newUser.id});
//       return UniversalData(data: 'User added! ');
//     } on FirebaseAuthException catch (e) {
//       return UniversalData(error: e.code);
//     } catch (e) {
//       return UniversalData(error: e.toString());
//     }
//   }

//   Future<UniversalData> logInUser(
//       {required String email, required String password}) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       return UniversalData(data: userCredential);
//     } on FirebaseAuthException catch (e) {
//       return UniversalData(error: e.code);
//     } catch (e) {
//       return UniversalData(error: e.toString());
//     }
//   }

//   Future<UniversalData> logOutUser() async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       return UniversalData(data: 'User Logged Out!');
//     } on FirebaseAuthException catch (e) {
//       return UniversalData(error: e.code);
//     } catch (e) {
//       return UniversalData(error: e.toString());
//     }
//   }

//   Future<UniversalData> signInWithGoogle() async {
//     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//     final GoogleSignInAuthentication? googleAuth =
//         await googleUser?.authentication;
//     final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
//     try {
//       UserCredential userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       return UniversalData(data: userCredential);
//     } on FirebaseAuthException catch (e) {
//       return UniversalData(error: e.code);
//     } catch (e) {
//       return UniversalData(error: e.toString());
//     }
//   }

  
// }
