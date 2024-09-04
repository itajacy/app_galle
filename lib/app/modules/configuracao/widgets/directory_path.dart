import 'dart:io';

import 'package:path_provider/path_provider.dart';

class DirectoryPath {
  getPath() async {
    // final filePath = Directory(
    //     "/storage/emulated/0/Android/media/com.example.down_any_file/files");
    final Directory? tempDir = await getExternalStorageDirectory();
    // final filePath = Directory("${tempDir!.path}/files");
    final filePath = Directory(tempDir!.path);
    if (await filePath.exists()) {
      return filePath.path;
    } else {
      await filePath.create(recursive: true);
      return filePath.path;
    }
  }
}
