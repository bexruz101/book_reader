import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';

class VocabularyScreen extends StatefulWidget {
  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text(tr('Vocabulary'),style: Theme.of(context).textTheme.titleLarge,),
        elevation: 0,
      ),
    );
  }
}
