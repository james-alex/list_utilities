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

  /// Removes a range of elements from this set.
  ///
  /// Removes the elements with positions greater than or
  /// equal to [start] and less than [end], from the set.
  /// This reduces the set's length by `end - start`.
  ///
  /// The provided range, given by [start] and [end], must be valid.
  /// A range from [start] to [end] is valid if `0 ≤ start ≤ end ≤ length`.
  /// An empty range (with `end == start`) is valid.
  ///
  /// __Note:__ This method should not be used on unordered sets,
  /// such as a [HashSet].
  void removeRange(int start, int end) {
    assert(start >= 0 && start <= end && end <= length);
    for (var i = 0; i < end - start; i++) {
      remove(elementAt(start));
    }
  }

  /// Returns a new set containing the elements between [start] and [end].
  Set<T> subset(int from, int? to) {
    final elements = <T>{};
    for (var i = from; i < (to ?? length); i++) {
      elements.add(elementAt(i));
    }
    return elements;
  }

  /// Returns a new list containing all of the elements in
  /// this list that aren't also contained within [subset].
  Set<T> exclude(Iterable<T> subset) {
    final elements = <T>{};
    for (var element in this) {
      if (!subset.contains(element)) elements.add(element);
    }
    return elements;
  }

  /// Returns a subset containing every element in this set,
  /// excluding those at the defined [indexes].
  Set<T> excludeByIndex(Iterable<int> indexes) {
    final elements = <T>{};
    for (var i = 0; i < length; i++) {
      if (!indexes.contains(i)) elements.add(elementAt(i));
    }
    return elements;
  }

  /// Returns a new [Set] from `this` with [other]'s elements
  /// appended to the end.
  Set<T> operator +(Iterable<T> other) => Set<T>.from(this)..addAll(other);
}
