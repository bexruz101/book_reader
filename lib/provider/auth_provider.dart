import 'dart:io';
import 'package:book_reader/data/db/local_db.dart';
import 'package:book_reader/model/universal_data.dart';
import 'package:book_reader/model/user_model.dart';
import 'package:book_reader/utils/app_routes.dart';
import 'package:book_reader/utils/ui_utils/loading_dialog.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../utils/ui_utils/error_message_dialog.dart';

class AuthProvider with ChangeNotifier {
  final AuthService firebaseService;

  AuthProvider({
    required this.firebaseService,
  });

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  String userUrl = '';
  String contact = '';
  String userFile = '';

  GlobalKey<FormState> key = GlobalKey();

  CollectionReference _reference =
      FirebaseFirestore.instance.collection('user_detail');

  loginButtonPressed() {
    emailController.clear();
    userController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
  }

  signUpButtonPressed() {
    emailController.clear();
    passwordController.clear();
  }

  checkPassword(BuildContext context) {
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    String userName = userController.text.trim();
    String userEmail = emailController.text.trim();
    if (password == confirmPassword &&
        userName.isNotEmpty &&
        userEmail.isNotEmpty &&
        userUrl.isNotEmpty) {
      signUpUser(context);
    } else {
      showErrorMessage(
          message: "Something wrong check fields again!!!", context: context);
    }
  }

  Future<void> signUpUser(BuildContext context) async {
    LocalDatabase.saveBool('loginState', true);
    String email = emailController.text;
    String password = passwordController.text;
    showLoading(context: context);
    UniversalData universalData =
        await firebaseService.signUpUser(email: email, password: password);

    String itemName = userController.text;
    String itemEmail = emailController.text;
    Map<String, String> dataToSend = {
      'name': itemName,
      'email': itemEmail,
      'image': userUrl,
      'userFile': userFile,
    };

    _reference.add(dataToSend);

    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        addUser(context: context);
        loginButtonPressed();
        Navigator.pushReplacementNamed(context, RouteNames.tabBoxScreen);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }

  Stream<User?> listenAuthState() => FirebaseAuth.instance.authStateChanges();

  Future<void> loginUser(BuildContext context) async {
    LocalDatabase.saveBool('loginState', true);
    String email = emailController.text;
    String password = passwordController.text;
    showLoading(context: context);
    UniversalData universalData =
        await firebaseService.logInUser(email: email, password: password);
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        loginButtonPressed();
        Navigator.pushReplacementNamed(context, RouteNames.tabBoxScreen);
      }
    } else {
      if (context.mounted) {
        showErrorMessage(message: universalData.error, context: context);
      }
    }
  }

  Future<void> logOutUser(BuildContext context) async {
    showLoading(context: context);
    UniversalData universalData = await firebaseService.logOutUser();
    userUrl = '';
    if (context.mounted) {
      hideLoading(dialogContext: context);
    }
    if (universalData.error.isEmpty) {
      if (context.mounted) {
        showConfirmMessage(
            message: universalData.data as String, context: context);
      } else {
        if (context.mounted) {
          showErrorMessage(message: universalData.error, context: context);
        }
      }
    }
  }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      showLoading(context: context);
      UniversalData universalData = await firebaseService.signInWithGoogle();
      hideLoading(dialogContext: context);
      if (universalData.error.isEmpty) {
        showConfirmMessage(
            message: 'User Signed In With Google', context: context);
      } else {
        showErrorMessage(message: universalData.error, context: context);
      }
    } catch (error) {
      showErrorMessage(
          message: 'Sign-in failed. Please try again later.', context: context);

      // Print the specific Firebase error code and message
      if (error is FirebaseAuthException) {
        print('Firebase Error Code: ${error.code}');
        print('Firebase Error Message: ${error.message}');
      }
    }
  }

  Future<void> addUser({required BuildContext context}) async {
    String userName = userController.text.trim();
    String userEmail = emailController.text.trim();
    String password = passwordController.text.trim();
    if (userName.isNotEmpty && userEmail.isNotEmpty && userUrl.isEmpty) {
      UserModel userModel = UserModel(
          id: '',
          username: userName,
          email: userEmail,
          password: password,
          avatar: userUrl,
          createdAt: DateTime.now().toString());
      UniversalData universalData =
          await firebaseService.addUser(userModel: userModel);
      if (universalData.error.isEmpty) {
        if (context.mounted) {
          showConfirmMessage(
              message: universalData.data as String, context: context);
          loginButtonPressed();
          Navigator.pop(context);
        }
      } else {
        // ignore: use_build_context_synchronously
        showErrorMessage(message: 'Fields not completed', context: context);
      }
    }
  }

  Future<void> uploadCategoryImage(BuildContext context, XFile xFile) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirImages = referenceRoot.child('images');
    Reference referenceImageToUpload = referenceDirImages.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(xFile.path));
      userUrl = await referenceImageToUpload.getDownloadURL();
      notifyListeners();
      print('AAAAAAAAAAAAA${userUrl}AAAAAAAAAAAAAAAAAAAAA');
    } catch (e) {
      print('EEEEEEEEEEERRRRRRRORRRRRRRRRR${e}');
    }
  }

  Future<void> uploadFile(String file) async {
    String uniqueFileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference referenceRoot = FirebaseStorage.instance.ref();
    Reference referenceDirFiles = referenceRoot.child('files');
    Reference referenceImageToUpload = referenceDirFiles.child(uniqueFileName);
    try {
      await referenceImageToUpload.putFile(File(file));
      userFile = await referenceImageToUpload.getDownloadURL();
      notifyListeners();
      print('BBBBBBBBBBBBBBB${userFile}BBBBBBBB');
    } catch (e) {
      print('EEEEEEEEEEERRRRRRRORRRRRRRRRR${e}');
    }
  }
}
