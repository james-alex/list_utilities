import 'dart:math';

/// Extends [Iterable] with additional basic methods.
extension IterableUtilities<T> on Iterable<T> {
  /// Returns a random value from the iterable.
  T random([int seed]) {
    assert(isNotEmpty, 'The iterable must not be empty.');
    return elementAt(_getRandomIndex(seed));
  }

  /// Returns `true` if `this` and [other] are the same length and
  /// contain all of the same elements.
  ///
  /// If [ordered] is `true`, the elements must be in the same order
  /// in both iterables for this to return `true`.
  bool matches(Iterable<T> other, {bool ordered = false}) {
    assert(other != null);
    assert(ordered != null);

    if (length != other.length) {
      return false;
    }

    if (ordered) {
      for (var i = 0; i < length; i++) {
        if (elementAt(i) != other.elementAt(i)) {
          return false;
        }
      }
    } else {
      final elements = toList();
      for (var element in other) {
        if (!elements.remove(element)) {
          return false;
        }
      }
    }

    return true;
  }

  /// Returns a random [int] within the range of this list's indexes.
  int _getRandomIndex(int seed) => Random(seed).nextInt(length);
}
