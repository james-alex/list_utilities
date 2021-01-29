/// /// Extends [Set] with additional basic methods.
extension SetUtilities<T> on Set<T> {
  /// Returns `true` if [other] is the same length as `this` and
  /// contains all of the same elements, regardless of their order.
  bool equals(Iterable<T> other) {
    assert(other != null);

    if (length != other.length) {
      return false;
    }

    final elements = toSet();
    for (var element in other) {
      if (!elements.remove(element)) {
        return false;
      }
    }

    return true;
  }

  /// Returns a new [Set] from `this` with [other]'s elements
  /// appended to the end.
  Set<T> operator +(Iterable<T> other) {
    assert(other != null);
    return Set<T>.from(this)..addAll(other);
  }
}
