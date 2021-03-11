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
  // Remove duplicates
  List<AnsweredQuestion> currentAnsweredQuestionList =
      (await answeredQuestionData).map((element) =>
          AnsweredQuestion.fromFileString(element).toAnsweredQuestion);

  // For Each Duplicate, Replace the new one with the old
  for (final v in list) {
    if (currentAnsweredQuestionList.contains(v)) {
      currentAnsweredQuestionList.remove(v);
      currentAnsweredQuestionList.add(v);
    }
  }

  final file = await answeredQuestionFile;
  file.writeAsString('');
  for (final v in currentAnsweredQuestionList) {
    file.writeAsString('${v.toFileString}\n', mode: FileMode.append);
    print(v);
  }
  return file;
}

Future<List<String>> get answeredQuestionData async {
  try {
    final file = await answeredQuestionFile;
    final string = await file.readAsString();
    print(string.split('\n'));
    return string.split('\n');
  } catch (e) {
    return ['ERROR! ALARM ALARM'];
  }
}
