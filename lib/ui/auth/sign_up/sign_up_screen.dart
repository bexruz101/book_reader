// import 'package:book_reader/provider/auth_provider.dart';
// import 'package:book_reader/ui/auth/widgets/global_button.dart';
// import 'package:book_reader/ui/auth/widgets/global_text_field.dart';
// import 'package:book_reader/utils/colors.dart';
// import 'package:book_reader/utils/extensions.dart';
// import 'package:book_reader/utils/images.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import '../../../data/storage_repository/local_db.dart';

// // ignore: must_be_immutable
// class SignUpScreen extends StatelessWidget {
//   SignUpScreen(
//       {super.key, required this.onChanged, required this.parenContext});

//   final VoidCallback onChanged;
//   final BuildContext parenContext;
  
//   ImagePicker picker = ImagePicker();

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 25.w),
//       key: key,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//               child: ListView(
//             children: [
//               20.ph,
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     'Sign up',
//                     style: Theme.of(context)
//                         .textTheme
//                         .displaySmall!
//                         .copyWith(fontWeight: FontWeight.w400),
//                   ),
//                   5.ph,
//                   RichText(
//                     text: TextSpan(
//                       text: 'Welcome to ',
//                       style:
//                           Theme.of(context).textTheme.headlineMedium!.copyWith(
//                                 color: AppColors.black,
//                               ),
//                       children: <TextSpan>[
//                         TextSpan(
//                             text: 'BookReader',
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .headlineMedium!
//                                 .copyWith(color: AppColors.C_DE7773)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//               24.ph,
//               CircleAvatar(
//                 backgroundColor: AppColors.C_DE7773,
//                 radius: 60,
//                 child: TextButton(
//                   onPressed: () {
//                     showBottomSheetDialog(parenContext);
//                   },
//                   child: context.watch<AuthProvider>().userUrl.isEmpty
//                       ? Icon(
//                           Icons.camera_alt_outlined,
//                           color: AppColors.white.withOpacity(0.8),
//                           size: 45.r,
//                           weight: 1,
//                         )
//                       : CircleAvatar(
//                           backgroundImage:
//                               context.watch<AuthProvider>().userUrl.isEmpty
//                                   ? null
//                                   : NetworkImage(
//                                       context.watch<AuthProvider>().userUrl),
//                           radius: 60,
//                         ),
//                 ),
//               ),
//               30.ph,
//               GlobalTextField(
//                 hintText: 'Username',
//                 textInputType: TextInputType.name,
//                 isPassword: false,
//                 controller: context.read<AuthProvider>().userController,
//               ),
//               24.ph,
//               GlobalTextField(
//                   hintText: 'Email',
//                   textInputType: TextInputType.emailAddress,
//                   isPassword: false,
//                   controller: context.read<AuthProvider>().emailController),
//               24.ph,
//               GlobalTextField(
//                   hintText: 'Password',
//                   textInputType: TextInputType.visiblePassword,
//                   isPassword: true,
//                   controller: context.read<AuthProvider>().passwordController),
//               24.ph,
//               GlobalTextField(
//                   hintText: 'Confirm Password',
//                   textInputType: TextInputType.visiblePassword,
//                   isPassword: true,
//                   controller:
//                       context.read<AuthProvider>().confirmPasswordController),
//               24.ph,
//               GlobalButton(
//                   title: 'Sign Up',
//                   onTap: () {
//                     StorageRepository.deleteBool('loginState');
//                     StorageRepository.putBool('loginState', true);
//                     context.read<AuthProvider>().checkPassword(context);
//                   }),
//               15.ph,
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   TextButton(
//                       onPressed: () {
//                         onChanged.call();
//                         context.read<AuthProvider>().loginButtonPressed();
//                       },
//                       child: RichText(
//                         text: TextSpan(
//                           text: "Already have an account? ",
//                           style: Theme.of(context).textTheme.titleMedium,
//                           children: <TextSpan>[
//                             TextSpan(
//                                 text: 'Log In',
//                                 style: Theme.of(context)
//                                     .textTheme
//                                     .titleMedium!
//                                     .copyWith(color: AppColors.C_DE7773),
//                                 recognizer: TapGestureRecognizer()
//                                   ..onTap = () {
//                                     onChanged.call();
//                                     context
//                                         .read<AuthProvider>()
//                                         .loginButtonPressed();
//                                   }),
//                           ],
//                         ),
//                       ))
//                 ],
//               ),
//               TextButton(
//                   onPressed: () {
//                     context.read<AuthProvider>().signInWithGoogle(context);
//                   },
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text('Sing Up with Google'),
//                       const SizedBox(
//                         width: 12,
//                       ),
//                       SvgPicture.asset(AppImages.google)
//                     ],
//                   ))
//             ],
//           ))
//         ],
//       ),
//     );
//   }

//   void showBottomSheetDialog(BuildContext context2) {
//     showModalBottomSheet(
//         backgroundColor: Colors.transparent,
//         context: context2,
//         builder: (BuildContext context) {
//           return Container(
//             padding: const EdgeInsets.all(24),
//             height: 200,
//             decoration: BoxDecoration(
//                 color: AppColors.white,
//                 borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(16.r),
//                     topRight: Radius.circular(16.r))),
//             child: Column(
//               children: [
//                 ListTile(
//                   onTap: () {
//                     getFromCamera(context2);
//                     Navigator.pop(context);
//                   },
//                   leading: Icon(
//                     Icons.camera_alt,
//                     color: AppColors.black.withOpacity(0.6),
//                   ),
//                   title: Text('Select from Camera',
//                       style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                             color: AppColors.black.withOpacity(0.6),
//                           )),
//                 ),
//                 ListTile(
//                   onTap: () {
//                     getFromGallery(context2);
//                     Navigator.pop(context);
//                   },
//                   leading: Icon(
//                     Icons.photo,
//                     color: AppColors.black.withOpacity(0.6),
//                   ),
//                   title: Text('Select from Gallery',
//                       style: Theme.of(context).textTheme.titleMedium!.copyWith(
//                             color: AppColors.black.withOpacity(0.6),
//                           )),
//                 )
//               ],
//             ),
//           );
//         });
//   }

//   Future<void> getFromCamera(BuildContext context) async {
//     XFile? xFile = await ImagePicker().pickImage(
//       source: ImageSource.camera,
//       maxHeight: 512,
//       maxWidth: 512,
//     );
//     if (xFile != null) {
//       // ignore: use_build_context_synchronously
//       await Provider.of<AuthProvider>(context, listen: false)
//           .uploadCategoryImage(context, xFile);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image not selected')));
//     }
//   }

//   Future<void> getFromGallery(BuildContext context) async {
//     XFile? xFile = await ImagePicker().pickImage(
//       source: ImageSource.gallery,
//       maxHeight: 512,
//       maxWidth: 512,
//     );
//     if (xFile != null) {
//       await Provider.of<AuthProvider>(context, listen: false)
//           .uploadCategoryImage(context, xFile);
//     }else {
//       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Image not selected')));
//     }
    
//   }
// }
