import 'iterable_utilities.dart';
import 'list_utilities.dart';

/// Extends [Set] with additional basic methods.
extension SetUtilities<T> on Set<T> {
  /// Returns a random element from this set.
  Set<T> getRandom(int count, [int? seed]) {
    assert(isNotEmpty, 'The set must not be empty.');
    assert(count > 0 && count <= length);

    final indexes = List<int>.generate(length, (index) => index);
    final randomIndexes = <int>[];
    for (var i = 0; i < length; i++) {
      randomIndexes.add(indexes.removeRandom());
    }

    return List<T>.generate(count, (index) => elementAt(randomIndexes[index]))
        .toSet();
  }

  /// Removes and returns a random element in this set.
  T removeRandom([int? seed]) {
    assert(isNotEmpty, 'The set must not be empty.');
    final element = random(seed);
    remove(element);
    return element;
  }

  /// Removes and returns the first element in this set.
  T removeFirst() {
    assert(isNotEmpty, 'The set must not be empty.');
    final element = first;
    remove(first);
    return element;
  }

  /// Removes and returns the last element in this set.
  T removeLast() {
    assert(isNotEmpty, 'The set must not be empty.');
    final element = last;
    remove(last);
    return element;
  }

  /// Returns a new [Set] from `this` with [other]'s elements
  /// appended to the end.
  Set<T> operator +(Iterable<T> other) => Set<T>.from(this)..addAll(other);
}
