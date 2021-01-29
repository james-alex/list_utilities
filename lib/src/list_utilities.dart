import 'dart:math';

/// /// Extends [List] with additional basic methods.
extension ListUtilities<T> on List<T> {
  /// Returns a random value from the list.
  T random([int seed]) {
    assert(isNotEmpty, 'The list must not be empty.');

    final random = Random(seed);

    return this[random.nextInt(length)];
  }

  /// Removes all `null` values from the list.
  void removeNull() => removeWhere((value) => value == null);

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
}

/// A generator supplied to the [resizeAndGenerate] extension method.
typedef _Generator<T> = T Function(int index);
