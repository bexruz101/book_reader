import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerr {

  static Future<File?> pickFiles() async {
    final result = await FilePicker.platform.pickFiles(
        type: FileType.custom, allowedExtensions: ['pdf'], allowMultiple: true);
    if (result == null) return null;
    return File(result.files.first! as String);
  }
}
