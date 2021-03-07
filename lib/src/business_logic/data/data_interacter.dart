import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../models/question.dart';

Future<String> get localPath async {
  final directory = await getApplicationDocumentsDirectory();
  print(directory.path); // For Debugging
  return directory.path;
}

Future<File> get answeredQuestionFile async {
  final path = await localPath;
  return File('$path/answeredQuestion.data');
}

Future<File> writeAnsweredQuestion(List<AnsweredQuestion> list) async {
  final file = await answeredQuestionFile;
  for (final v in list) {
    file.writeAsString('${v.toFileString}\n', mode: FileMode.append);
  }
  return file;
}

Future<List<String>> get answeredQuestionData async {
  try {
    final file = await answeredQuestionFile;
    final string = await file.readAsString();
    return string.split('\n');
  } catch (e) {
    return ['ERROR! ALARM ALARM'];
  }
}
