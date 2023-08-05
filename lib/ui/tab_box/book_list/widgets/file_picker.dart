import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerr {

  static Future<List<String?>> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf'], allowMultiple: true);
    if (result == null) return [];
    print('RESULT PATHSS:$result.paths');
    return result.paths;
  }
}
