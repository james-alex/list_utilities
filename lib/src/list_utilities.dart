import 'iterable_utilities.dart';

/// /// Extends [List] with additional basic methods.
extension ListUtilities<T> on List<T> {
  /// Removes and returns a random value from this list.
  T removeRandom([int seed]) {
    assert(isNotEmpty, 'The list must not be empty.');
    final element = random(seed);
    remove(element);
    return element;
  }

  /// Removes all `null` values from this list.
  void removeNull() => removeWhere((value) => value == null);

  /// Removes the first element in this list.
  T removeFirst() => removeAt(0);

  /// Removes the first element in this list that satisfies [test].
  bool removeFirstWhere(_Test<T> test) {
    assert(test != null);

    for (var element in this) {
      if (test(element)) {
        remove(element);
        return true;
      }
    }

    return false;
  }

  /// Removes the last element in this list that satisfies [test].
  bool removeLastWhere(_Test<T> test) {
    assert(test != null);

    for (var i = length - 1; i >= 0; i--) {
      final element = this[i];
      if (test(element)) {
        removeAt(i);
        return true;
      }
    }

    return false;
  }

  /// Removes the number of elements defined by [count],
  /// starting from [index].
  void removeFrom(int index, int count) {
    assert(index != null && index >= 0 && index < length);
    assert(count != null && count >= 0 && count <= length - index);
    removeRange(index, index + count);
  }

  /// Removes the number of elements defined by [count] from the end
  /// of the list.
  void removeFromEnd(int count) {
    assert(count != null && count >= 0 && count <= length);
    removeRange(length - count, length);
  }

  /// Resizes the list by [resizeBy], setting the new elements to [fill]
  /// if [resizeBy] is positive, otherwise removing elements if [resizeBy]
  /// is negative.
  void resizeAndFill(int resizeBy, T fill) {
    assert(resizeBy != null);

    if (resizeBy.isNegative) {
      removeFromEnd(-resizeBy);
    } else {
      addAll(List<T>.filled(resizeBy, fill));
    }
  }

  /// Resizes the list by [resizeBy], setting the new elements with the
  /// [generator] if [resizeBy] is positive, otherwise removing elements
  /// if [resizeBy] is negative.
  void resizeAndGenerate(int resizeBy, _Generator<T> generator) {
    assert(resizeBy != null);
    assert(generator != null);

    if (resizeBy.isNegative) {
      removeFromEnd(-resizeBy);
    } else {
      addAll(List<T>.generate(resizeBy, generator));
    }
  }
}

/// A generator supplied to the [resizeAndGenerate] extension method.
typedef _Generator<T> = T Function(int index);

/// A function supplied to any methods that test the elements in the list.
typedef _Test<T> = bool Function(T element);
