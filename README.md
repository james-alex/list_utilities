# list_utilities

A collection of basic extension methods for [Iterable]s, [List]s, and [Set]s;
and a library containing a base class for higher-level implementations of [List].

__See:__ [num_utilities](https://pub.dev/packages/num_utilities)

# Usage

```dart
import 'package:list_utilities/list_utilities.dart';
```

## Iterable Methods

Methods extending [Iterable] are also be available on [List]s, [Set]s, or
any other implementation of [Iterable].

### random

The [random] method returns a random value from the iterable.

```dart
final numbers = [0, 1, 2, 3, 4];
print(numbers.random()); // 3 (or any of the other numbers.)
```

### matches

The [matches] method returns `true` if the other iterable is the same length
as the calling iterable and contains all of the same elements.

[matches] has an optional parameter, [ordered], which if `true`, requires the
elements of each iterable to be in the same order to satisfy [matches].

```dart
final numbersA = {1, 2, 3, 4, 5};
final numbersB = {5, 4, 3, 2, 1};
print(numbersA.matches(numbersB)); // true
print(numbersA.matches(numbersB, ordered: true)); // false
```

## List Methods

### getRandom

The [getRandom] method returns a new set containing random
elements from the set.

```dart
final numbers = [0, 1, 2, 3, 4];
print(numbers.getRandom(3)); // [3, 1, 4] (or any other combination of numbers.)
```

### removeRandom

The [removeRandom] method removes and returns an element from
the list at random.

```dart
final numbers = [0, 1, 2, 3, 4];
print(numbers.removeRandom()); // 3 (or any of the  other numbers.)
print(numbers); // [0, 1, 2, 4]
```

__Note:__ [removeRandom] is included on [List]s and [Set]s, but not
[Iterables] because [Iterable]s lack methods to remove elements without
first converting it to a [List] or [Set].

### removeNull

The [removeNull] method removes all `null` values from the list.

```dart
final numbers = [0, 1, null, 3, null];
numbers.removeNull();
print(numbers); // [0, 1, 3]
```

### removeFirst

The [removeFirst] method removes the first item from the list.

```dart
final numbers = [0, 1, 2, 3, 4];
print(numbers.removeFirst()); // 0
print(numbers); // [1, 2, 3, 4]
```

### removeFirstWhere

The [removeFirstWhere] method iterates through the list and removes
the first element that satisfies the test.

```dart
final numbers = [0, 1, 2, 3, 4];
numbers.removeFirstWhere((number) => number.isOdd);
print(numbers); // [0, 2, 3, 4]
```

### removeLastWhere

The [removeLastWhere] method iterates through the list in reverse and
removes the first element that satisfies the test.

```dart
final numbers = [0, 1, 2, 3, 4];
numbers.removeLastWhere((number) => number.isOdd);
print(numbers); // [0, 1, 2, 4]
```

### resizeAndFill

The [resizeAndFill] method adds or removes elements from the list,
setting any new values to the provided value.

```dart
final numbers = [0, 1, 2, 3, 4];
numbers.resizeAndFill(-2, 0);
print(numbers); // [0, 1, 2]
numbers.resizeAndFill(2, 0);
print(numbers); // [0, 1, 2, 0, 0]
```

### resizeAndGenerate

The [resizeAndGenerate] method adds or removes elements from the list,
setting any new values with the provided generator.

```dart
final numbers = [0, 1, 2, 3, 4];
numbers.resizeAndGenerate(5, (index) => index);
print(numbers); // [0, 1, 2, 3, 4, 0, 1, 2, 3, 4]
numbers.resizeAndGenerate(-5, (index) => index);
print(numbers); // [0, 1, 2, 3, 4]
```

### removeFrom

The [removeFrom] method removes the specified number of elements,
starting at the provided index.

```dart
final numbers = [0, 1, 2, 3, 4];
numbers.removeFrom(3, 2);
print(numbers); // [0, 1, 2]
numbers.removeFrom(0, 2);
print(numbers); // [2]
```

### removeFromEnd

The [removeFromEnd] method removes the specified number of elements
from the end of the list.

```dart
final numbers = [0, 1, 2, 3, 4];
numbers.removeFromEnd(2);
print(numbers); // [0, 1, 2]
```

### transform

The [transform] method updates the element at the provided index to
the value returned by the provided transformer.

```dart
final numbers = [0, 1, 2, 3, 4];
numbers.transform(2, (number) => number * 2);
print(numbers); // [0, 1, 4, 3, 4]
```

### transformAll

The [transformAll] method updates every element in a list to
the value returned by the provided transformer.

```dart
final numbers = [0, 1, 2, 3, 4];
numbers.transformAll((number) => number * 2);
print(numbers); // [0, 2, 4, 6, 8]
```

### count

The [count] method returns the number of instances there are of the
provided object in a list.

```dart
final numbers = [0, 0, 1, 2, 1, 0, 0];
print(numbers.count(0)); // 4
print(numbers.count(1)); // 2
print(numbers.count(2)); // 1
```

## Set Methods

### getRandom

The [getRandom] method returns a new set containing random
elements from the set.

```dart
final numbers = {0, 1, 2, 3, 4};
print(numbers.getRandom(3)); // {3, 1, 4} (or any other combination of numbers.)
```

### removeRandom

The [removeRandom] method removes and returns an element from
the set at random.

```dart
final numbers = {0, 1, 2, 3, 4};
print(numbers.removeRandom()); // 3 (or any of the other numbers.)
print(numbers); // {0, 1, 2, 4}
```

__Note:__ [removeRandom] is included on [List]s and [Set]s, but not [Iterables]
because [Iterable]s lack methods to remove elements without first converting it
to a [List] or [Set].

### removeFirst

The [removeFirst] method removes the first element in the set and
returns the removed element.

```dart
final numbers = {0, 1, 2, 3, 4};
print(numbers.removeFirst()); // 0
print(numbers); // {1, 2, 3, 4}
```

### removeLast

The [removeLast] method removes the last element in the set and
returns the removed element.

```dart
final numbers = {0, 1, 2, 3, 4};
print(numbers.removeLast()); // 4
print(numbers); // {0, 1, 2, 3}
```

### + operator

The `+` operator returns a new [Set] by appending the second [Set]'s
values to the end of the first [Set]s'.

```dart
final numbersA = {1, 2, 3};
final numbersB = {4, 5, 6};
print(numbersA + numbersB); // {1, 2, 3, 4, 5, 6}
```

# base_list

```dart
import 'package:list_utilities/base_list.dart';
```

The `base_list` library exposes an abstract class, [BaseList], as well as a
number of `typedef`s to use when overriding methods in an implementing class.

[BaseList] implements `List<E>` and wraps another `List<E>`, [elements], that
[BaseList]'s methods interface with.

[BaseList] is intended to be used in cases where you need to implement a new
type of list, but not every method necessary to implement a list needs to be
customized.

Unlike [List], [BaseList] requires [growable] as a parameter; which, depending
on the implementation, doesn't necessarily equate to the wrapped list, [elements],
being a fixed-length list or not.

__Note:__ Overridden methods that modify the length of [elements] should respect
[growable], and throw an [UnsupportedError] if the user tries to modify the length
of the list, regardless of whether [elements] is a fixed-length list or not.

```dart
/// An implementation of `List<E>` that stores a list
/// containing every element added to it, even if those
/// elements have since been removed.
class HistoryList<E> extends BaseList<E> {
  const HistoryList() : super(<E>[], growable: true);

  List<E> get history => List<E>.from(_history);

  final _history = <E>[];

  @override
  void add(E value) {
    elements.add(value);
    _history.add(value);
  }

  @override
  void addAll(Iterable<E> iterable) {
    elements.addAll(iterable);
    _history.addAll(iterable);
  }

  @override
  void insert(int index, E element) {
    elements.insert(index, element);
    _history.add(element);
  }

  @override
  void insertAll(int index, Iterable<E> iterable) {
    elements.insertAll(index, iterable);
    _history.addAll(iterable);
  }
}
```

__See:__ [labeled_list](https://pub.dev/packages/labeled_list) and
[unique_list](https://pub.dev/packages/unique_list) for complete examples
of how [BaseList] should be implemented.
