import 'package:book_reader/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showErrorMessage(
    {required String message, required BuildContext context}) {
  showDialog(
      context: context,
      builder: ((BuildContext context) => AlertDialog(
            backgroundColor: AppColors.white,
            title: const Text('Error',
                style: TextStyle(fontWeight: FontWeight.w800)),
            content: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                message,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.C_273032),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok'))
            ],
          )));
}

Future<void> showConfirmMessage(
    {required String message, required BuildContext context}) async {
  await showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
            backgroundColor: AppColors.white,
            content: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                message,
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: AppColors.C_273032),
              ),
            ),
            actions: [
              CupertinoDialogAction(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('ok')),
            ],
          ));
}
