import 'package:book_reader/utils/app_routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../data/db/local_db.dart';
class VocabularyScreen extends StatefulWidget {

  const VocabularyScreen({super.key});

  @override
  State<VocabularyScreen> createState() => _VocabularyScreenState();
}

class _VocabularyScreenState extends State<VocabularyScreen> {
  List<Map<String,dynamic>> savedStrings = [];

  Future<void> _loadSavedStrings() async {
    List<Map<String,dynamic>> strings = await LocalDatabase.getVocabList('key');
    setState(() {
      savedStrings = strings;
    });
  }

  @override
  void initState() {
    _loadSavedStrings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tr('Vocabulary'),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        elevation: 0,
      ),
      body: savedStrings.isNotEmpty
          ? Expanded(
            child: ListView.builder(
                itemCount: savedStrings.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(savedStrings[index]['$index'][0]),
                    onTap: (){
                      Navigator.pushNamed(context, RouteNames.defScreen,arguments:'${savedStrings[index]['$index'][1]}');
                    },
                  );
                }),
          )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

