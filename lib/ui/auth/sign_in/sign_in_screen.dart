// import 'package:book_reader/provider/auth_provider.dart';
// import 'package:book_reader/ui/auth/widgets/global_button.dart';
// import 'package:book_reader/ui/auth/widgets/global_text_field.dart';
// import 'package:book_reader/utils/extensions.dart';
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import '../../../utils/colors.dart';

// class LogInScreen extends StatelessWidget {
//   const LogInScreen({super.key, required this.onChanged});

//   final VoidCallback onChanged;

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: 25.w),
//       child: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             70.ph,
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text('Sign in',style: Theme.of(context).textTheme.displaySmall!.copyWith(fontWeight: FontWeight.w400),),
//               5.ph,
//               RichText(
//                 text:  TextSpan(
//                   text: 'Welcome to ',
//                   style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.black,),
//                   children:  <TextSpan>[
//                     TextSpan(text: 'BookReader',style: Theme.of(context).textTheme.headlineMedium!.copyWith(color: AppColors.C_DE7773)),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//             65.ph,
//             GlobalTextField(
//                 hintText: 'Email',
//                 textInputType: TextInputType.emailAddress,
//                 isPassword: false,
//                 controller: context.read<AuthProvider>().emailController),
//             50.ph,
//             GlobalTextField(
//                 hintText: 'Password',
//                 textInputType: TextInputType.visiblePassword,
//                 isPassword: true,
//                 controller: context.read<AuthProvider>().passwordController),
//             50.ph,
//             GlobalButton(
//                 title: 'Log In',
//                 onTap: () {
//                   context.read<AuthProvider>().loginUser(context);
              
//                 }),
//             24.ph,
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 TextButton(
//                     onPressed: () {
//                       onChanged.call();
//                       context.read<AuthProvider>().signUpButtonPressed();
//                     },
//                     child: RichText(
//                       text: TextSpan(
//                         text: "Don't have an account? ",
//                         style: Theme.of(context).textTheme.titleMedium,
//                         children: <TextSpan>[
//                           TextSpan(
//                               text: 'Sign Up',
//                               style: Theme.of(context).textTheme.titleMedium!.copyWith(color: AppColors.C_DE7773),
//                               recognizer: TapGestureRecognizer()
//                                 ..onTap = () {
//                                   onChanged.call();
//                                   context
//                                       .read<AuthProvider>()
//                                       .signUpButtonPressed();
//                                 }),
//                         ],
//                       ),
//                     ))
//               ],
//             ),
        
//           ],
//         ),
//       ),
//     );
//   }
// }