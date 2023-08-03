import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FilePickerWid {

  static Future<List<String>?> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: true,
      allowedExtensions: ['pdf', 'doc', 'docx'],
    );
    if(result!=null){
      List<PlatformFile> files = result.files;
      List<String> filePaths = files.map((file)=>file.path!).toList();
      return filePaths;
    }
    else{
      return null;
    }
  }


  }

Future<File> saveFile(PlatformFile file) async{
  final appStorage = await getApplicationDocumentsDirectory();
  final newFiles = File('${appStorage.path}/${file.name}');
  return File(file.path!).copy(newFiles.path);
}