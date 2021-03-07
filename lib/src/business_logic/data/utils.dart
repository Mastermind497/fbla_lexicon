import 'dart:math';

import 'package:baseconvert/baseconvert.dart';

import '../models/question.dart';

final Random rng = Random();

/// Swaps elements in a [collection] from [index1] to [index2]
void swap<T>(List<T> collection, int index1, int index2) {
  T temp = collection[index1];
  collection[index1] = collection[index2];
  collection[index2] = temp;
}

/// Randomly shuffle given [collection] (inplace)
void shuffle<T>(List<T> collection) {
  for (int i = collection.length - 1; i > 1; i--) {
    swap(collection, i, rng.nextInt(i - 1));
  }
}

/// Generates an ID from the [event] and [number], converting the number to
/// base 61 from base 10 to have storage efficiency and future-proofing
String generateId(Event event, int number) {
  // Converts Base 10 to Base 64 with at least 3 characters, allowing more
  // than 200,000 combinations
  var inBase64 =
      representAsString(base(number, inBase: 10, outBase: 64)).padLeft(3, '0');
  var eventAbbreviation = event.nameId;
  return '$eventAbbreviation-$inBase64';
}
