// import 'package:book_reader/ui/tab_box/account/widgets/update_password/widgets/universal_text_field.dart';
// import 'package:book_reader/utils/extensions.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../provider/profile_provider.dart';
// import '../../../../../utils/ui_utils/loading_dialog.dart';

// TextEditingController firstText = TextEditingController();
// TextEditingController secondText = TextEditingController();

// Future<void> displayTextInputDialog(BuildContext context) async {
//   return showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           actions: [
//             UniversalTextField(
//                 controller: firstText, labelText: 'Enter new password'),
//             5.ph,
//             UniversalTextField(
//                 controller: secondText, labelText: 'Confirm new password'),
//             10.ph,
//             TextButton(
//                 onPressed: () {
//                   context
//                       .read<ProfileProvider>()
//                       .checkPasswordd(firstText.text, secondText.text);
//                   if (context.read<ProfileProvider>().checkPassword) {
//                     context
//                         .read<ProfileProvider>()
//                         .updateUserPassword(context, firstText.text);
//                     if (context.mounted) {
//                       hideLoading(dialogContext: context);
//                     }
//                   }
//                   firstText.text = '';
//                   secondText.text = '';
//                 },
//                 child: const Text('Submit')),
//           ],
//           title: const Text('Enter New Password'),
//         );
//       });
// }
