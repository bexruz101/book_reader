import 'package:book_reader/utils/ui_utils/custom_circular.dart';
import 'package:flutter/material.dart';

void showLoading({required BuildContext context}) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            alignment: AlignmentDirectional.center,
            decoration: BoxDecoration(),
            child: const Center(
              child: SizedBox(
                height: 70,
                width: 70,
                child: CustomCircularIndicator(strokeWidth: 6),
              ),
            ),
          ),
        );
      });
}

void hideLoading({required BuildContext? dialogContext}) {
  if (dialogContext != null) Navigator.pop(dialogContext);
}
