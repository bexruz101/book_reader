import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text(tr('All Books'),style: Theme.of(context).textTheme.titleLarge,),
        elevation: 0,
      ),
    );
  }
}
