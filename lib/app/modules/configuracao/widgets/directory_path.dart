import 'dart:io';

import 'package:flutter_archive/flutter_archive.dart';
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

  extractZip() async {
    final path = await getPath();
    final zipFile = File("$path/arq.zip");
    print('zipFile--> ${zipFile.path}');
    final destinationDir = await getDownloadsDirectory();
    try {
      await ZipFile.extractToDirectory(
          zipFile: zipFile, destinationDir: destinationDir!);
      // await ZipFile.extractToDirectory(
      //     zipFile: zipFile,
      //     destinationDir: destinationDir!,
      //     onExtracting: (zipEntry, progress) {
      //       print('progress: ${progress.toStringAsFixed(1)}%');
      //       print('name: ${zipEntry.name}');
      //       print('isDirectory: ${zipEntry.isDirectory}');
      //       // print(
      //       //     'modificationDate: ${zipEntry.modificationDate.toLocal().toIso8601String()}');
      //       print('uncompressedSize: ${zipEntry.uncompressedSize}');
      //       print('compressedSize: ${zipEntry.compressedSize}');
      //       print('compressionMethod: ${zipEntry.compressionMethod}');
      //       print('crc: ${zipEntry.crc}');
      //       return ZipFileOperation.includeItem;
      //     });
    } catch (e, s) {
      print('error--> $e');
      print('stacktrace --> $s');
    }
  }
}
