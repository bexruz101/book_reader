import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UniversalListTile extends StatelessWidget {
  const UniversalListTile({super.key, required this.title, required this.trailing, required this.onTap});

  final String title;
  final Widget trailing;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall!.copyWith(fontSize: 18),
      ),
      onTap: onTap,
      trailing: trailing,
    );
  }
}
