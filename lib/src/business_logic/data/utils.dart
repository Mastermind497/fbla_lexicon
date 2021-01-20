import 'dart:math';

final Random rng = Random();

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
