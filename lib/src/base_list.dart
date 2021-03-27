import 'dart:math' show Random;
import 'package:meta/meta.dart';

/// {@template base_list.BaseList}
///
/// A base class intended to be extended by higher-level implementations of [List].
///
/// {@endtemplate}
abstract class BaseList<E> implements List<E> {
  /// {@macro base_list.BaseList}
  const BaseList(this.elements, {required this.growable});

  /// The underlying [List] containing all of the elements in this list.
  @protected
  final List<E> elements;

  /// If `true`, this list is growable; otherwise, this is a fixed-length list.
  ///
  /// __Note:__ The underlying list, [elements], may be growable, or not,
  /// regardless of [growable]'s value, depending on how it was constructed.
  final bool growable;

  @override
  Iterator<E> get iterator => elements.iterator;

  @override
  Iterable<E> followedBy(Iterable<E> other) => elements.followedBy(other);

  @override
  Iterable<T> map<T>(Mapper<T, E> f) => elements.map<T>(f);

  @override
  Iterable<E> where(Test<E> test) => elements.where(test);

  @override
  Iterable<T> whereType<T>() => elements.whereType<T>();

  @override
  Iterable<T> expand<T>(Expand<T, E> f) => elements.expand<T>(f);

  @override
  bool contains(Object? element) => elements.contains(element);

  @override
  void forEach(ForEach<E> f) => elements.forEach(f);

  @override
  E reduce(Combine<E> combine) => elements.reduce(combine);

  @override
  T fold<T>(T initialValue, Fold<T, E> combine) =>
      elements.fold(initialValue, combine);

  @override
  bool every(Test<E> test) => elements.every(test);

  @override
  bool any(Test<E> test) => elements.any(test);

  @override
  E get first => elements.first;

  @override
  set first(E value) {
    elements.first = value;
  }

  @override
  E get last => elements.last;

  @override
  set last(E value) {
    elements.last = value;
  }

  @override
  E get single => elements.single;

  @override
  E firstWhere(Test<E> test, {OrElse<E>? orElse}) =>
      elements.firstWhere(test, orElse: orElse);

  @override
  E lastWhere(Test<E> test, {OrElse<E>? orElse}) =>
      elements.lastWhere(test, orElse: orElse);

  @override
  E singleWhere(Test<E> test, {OrElse<E>? orElse}) =>
      elements.singleWhere(test, orElse: orElse);

  @override
  E elementAt(int index) => elements.elementAt(index);

  @override
  void add(E value) {
    if (!growable) {
      throw UnsupportedError('Cannot add values to a fixed-length list.');
    }
    elements.add(value);
  }

  @override
  void addAll(Iterable<E> iterable) {
    if (!growable) {
      throw UnsupportedError('Cannot add values to a fixed-length list.');
    }
    elements.addAll(iterable);
  }

  @override
  Iterable<E> get reversed => elements.reversed;

  @override
  void sort([Compare<E>? compare]) => elements.sort(compare);

  @override
  void shuffle([Random? random]) => elements.shuffle(random);

  @override
  int indexOf(E element, [int start = 0]) => elements.indexOf(element, start);

  @override
  int indexWhere(Test<E> test, [int start = 0]) =>
      elements.indexWhere(test, start);

  @override
  int lastIndexWhere(Test<E> test, [int? start]) =>
      elements.lastIndexWhere(test, start);

  @override
  int lastIndexOf(E element, [int? start]) =>
      elements.lastIndexOf(element, start);

  @override
  void clear() => elements.clear();

  @override
  void insert(int index, E element) {
    if (!growable) {
      throw UnsupportedError('Cannot add values to a fixed-length list.');
    }
    elements.insert(index, element);
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    if (!growable) {
      throw UnsupportedError('Cannot add values to a fixed-length list.');
    }
    elements.insertAll(index, iterable);
  }

  @override
  void setAll(int index, Iterable<E> iterable) {
    elements.setAll(index, iterable);
  }

  @override
  bool remove(Object? value) {
    if (!growable) {
      throw UnsupportedError('Cannot remove values from a fixed-length list.');
    }
    return elements.remove(value);
  }

  @override
  E removeAt(int index) {
    if (!growable) {
      throw UnsupportedError('Cannot remove values from a fixed-length list.');
    }
    return elements.removeAt(index);
  }

  @override
  E removeLast() {
    if (!growable) {
      throw UnsupportedError('Cannot remove values from a fixed-length list.');
    }
    return elements.removeLast();
  }

  @override
  void removeWhere(Test<E> test) {
    if (!growable) {
      throw UnsupportedError('Cannot remove values from a fixed-length list.');
    }
    return elements.removeWhere(test);
  }

  @override
  void retainWhere(Test<E> test) {
    if (!growable) {
      throw UnsupportedError('Cannot remove values from a fixed-length list.');
    }
    return elements.retainWhere(test);
  }

  @override
  List<E> sublist(int start, [int? end]) => elements.sublist(start, end);

  @override
  Iterable<E> getRange(int start, int end) => elements.getRange(start, end);

  @override
  void setRange(int start, int end, Iterable<E> iterable, [int skipCount = 0]) {
    elements.setRange(start, end, iterable, skipCount);
  }

  @override
  void removeRange(int start, int end) {
    if (!growable) {
      throw UnsupportedError('Cannot remove values from a fixed-length list.');
    }
    elements.removeRange(start, end);
  }

  @override
  void fillRange(int start, int end, [E? fillValue]) =>
      elements.fillRange(start, end, fillValue);

  @override
  void replaceRange(int start, int end, Iterable<E> replacement) =>
      elements.replaceRange(start, end, replacement);

  @override
  Iterable<E> take(int count) {
    assert(count > 0);
    return elements.take(count);
  }

  @override
  Iterable<E> takeWhile(Test<E> test) => elements.takeWhile(test);

  @override
  Iterable<E> skip(int count) {
    assert(count > 0);
    return elements.skip(count);
  }

  @override
  Iterable<E> skipWhile(Test<E> test) => elements.skipWhile(test);

  @override
  bool get isEmpty => elements.isEmpty;

  @override
  bool get isNotEmpty => elements.isNotEmpty;

  @override
  Map<int, E> asMap() => elements.asMap();

  @override
  List<E> toList({bool growable = true}) => elements.toList(growable: growable);

  @override
  Set<E> toSet() => elements.toSet();

  @override
  int get length => elements.length;

  @override
  set length(int newLength) {
    if (!growable) {
      throw UnsupportedError(
          'Cannot add or remove values from a fixed-length list.');
    }
    elements.length = length;
  }

  @override
  E operator [](int index) => elements[index];

  @override
  void operator []=(int index, E value) {
    elements[index] = value;
  }

  @override
  List<E> operator +(List<E> other) => elements + other;

  @override
  String join([String separator = '']) => elements.join(separator);

  @override
  String toString() => elements.toString();
}

typedef Combine<E> = E Function(E value, E element);

typedef Compare<E> = int Function(E a, E b);

typedef Expand<T, E> = Iterable<T> Function(E element);

typedef Fold<T, E> = T Function(T previousValue, E element);

typedef ForEach<E> = void Function(E element);

typedef Generator<E> = E Function(int index);

typedef Mapper<T, E> = T Function(E element);

typedef OrElse<E> = E Function();

typedef Test<E> = bool Function(E element);
