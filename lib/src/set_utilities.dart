import 'iterable_utilities.dart';

/// Extends [Set] with additional basic methods.
extension SetUtilities<T> on Set<T> {
  /// Removes and returns a random value from the set.
  T removeRandom([int seed]) {
    assert(isNotEmpty, 'The list must not be empty.');
    final element = random(seed);
    remove(element);
    return element;
  }

  /// Returns a new [Set] from `this` with [other]'s elements
  /// appended to the end.
  Set<T> operator +(Iterable<T> other) {
    assert(other != null);
    return Set<T>.from(this)..addAll(other);
  }
}
