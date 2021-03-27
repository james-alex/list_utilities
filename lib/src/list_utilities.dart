import 'iterable_utilities.dart';

/// /// Extends [List] with additional basic methods.
extension ListUtilities<T> on List<T> {
  /// Returns a new list containing random elements from this list.
  ///
  /// [count] is the number of elements that will be returned.
  List<T> getRandom(int count, [int? seed]) {
    assert(isNotEmpty, 'The list must not be empty.');
    assert(count > 0 && count <= length);

    final indexes = List<int>.generate(length, (index) => index);
    final randomIndexes = <int>[];
    for (var i = 0; i < length; i++) {
      randomIndexes.add(indexes.removeRandom());
    }

    return List<T>.generate(count, (index) => elementAt(randomIndexes[index]));
  }

  /// Removes and returns a random value from this list.
  T removeRandom([int? seed]) {
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
    assert(index >= 0 && index < length);
    assert(count >= 0 && count <= length - index);
    removeRange(index, index + count);
  }

  /// Removes the number of elements defined by [count] from the end
  /// of the list.
  void removeFromEnd(int count) {
    assert(count >= 0 && count <= length);
    removeRange(length - count, length);
  }

  /// Resizes the list by [resizeBy], setting the new elements to [fill]
  /// if [resizeBy] is positive, otherwise removing elements if [resizeBy]
  /// is negative.
  void resizeAndFill(int resizeBy, T fill) {
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
    if (resizeBy.isNegative) {
      removeFromEnd(-resizeBy);
    } else {
      addAll(List<T>.generate(resizeBy, generator));
    }
  }

  /// Updates the element at [index] to the value returned by [transformer].
  void transform(int index, _Transformer<T> transformer) {
    assert(index >= 0 && index < length);
    this[index] = transformer(this[index]);
  }

  /// Updates every element in the list to the value returned by [transformer].
  void transformAll(_Transformer<T> transformer) {
    for (var i = 0; i < length; i++) {
      this[i] = transformer(this[i]);
    }
  }

  /// Returns the number of instances there are of [object] in this list.
  int count(T object) {
    var count = 0;
    for (var element in this) {
      if (object == element) count++;
    }
    return count;
  }

  /// Returns a new list containing all of the elements in
  /// this list that aren't also contained within [subset].
  List<T> exclude(Iterable<T> subset) {
    final elements = <T>[];
    for (var element in this) {
      if (!subset.contains(element)) elements.add(element);
    }
    return elements;
  }

  /// Returns a sublist containing every element in this list,
  /// excluding those at the defined [indexes].
  List<T> excludeByIndex(Iterable<int> indexes) {
    final elements = <T>[];
    for (var i = 0; i < length; i++) {
      if (!indexes.contains(i)) elements.add(elementAt(i));
    }
    return elements;
  }
}

/// A generator supplied to the [resizeAndGenerate] extension method.
typedef _Generator<T> = T Function(int index);

/// A function supplied to any methods that test the elements in the list.
typedef _Test<T> = bool Function(T element);

/// A function used to update the value of the element provided to it.
typedef _Transformer<T> = T Function(T element);
