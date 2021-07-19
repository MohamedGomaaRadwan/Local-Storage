import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FileStorageData{

  //get file path in the app
  Future<String> getLocalPath() async {
    var folder = await getApplicationDocumentsDirectory();
    return folder.path;
  }
  //get the file location (path)
  Future<File> getLocalFile() async {
    String path = await getLocalPath();
    return File('$path/counter.txt');
  }
  //write data to the file as a string
  Future<File> writeCounter(int c)async{
    File file = await getLocalFile();
    return file.writeAsString('$c');
  }
  //read data from the file as an integer
  Future<int> readCounter()async{
    try{
      final file =await getLocalFile();
      String content =await file.readAsString();
      return int.parse(content);
    }catch(e){
      throw e.toString();
    }
  }
}