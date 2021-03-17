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
  return File('$path/answeredQuestion.data')
    ..writeAsString('', mode: FileMode.append);
}

Future<List<QuestionData>> get clearAnsweredQuestionData async {
  final data = (await answeredQuestionData)
      .map(
        (element) => AnsweredQuestion.fromFileString(element),
      )
      .toList()
        ..removeWhere((element) => element == null);
  (await answeredQuestionFile).writeAsString('');
  return data;
}

Future<File> writeAnsweredQuestion(List<AnsweredQuestion> list) async {
  final file = await answeredQuestionFile;
  if (list == null || list.length == 0) {
    print('Exited');
    return file;
  }
  // Remove duplicates
  List<AnsweredQuestion> currentAnsweredQuestionList =
      (await answeredQuestionData)
          .map(
            (element) =>
                AnsweredQuestion.fromFileString(element)?.toAnsweredQuestion,
          )
          .toList();

  // For Each Duplicate, Replace the new one with the old
  for (final v in list) {
    if (currentAnsweredQuestionList.contains(v)) {
      currentAnsweredQuestionList.remove(v);
      currentAnsweredQuestionList.add(v);
      list.remove(v);
    }
  }

  currentAnsweredQuestionList.addAll(list);

  String output = '';
  for (final v in currentAnsweredQuestionList) {
    if (v == null) continue;
    output += '${v.toFileString}||';
  }
  file.writeAsString(output);
  print(output);
  return file;
}

Future<List<String>> get answeredQuestionData async {
  try {
    final file = await answeredQuestionFile;
    final string =
        (await file.readAsString()).replaceAll(')', '').replaceAll('(', '');
    print(string.split('||'));
    return string.split('||');
  } catch (e) {
    return ['ERROR! ALARM ALARM'];
  }
}
