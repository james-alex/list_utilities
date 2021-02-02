# list_utilities

A collection of basic extension methods for [Iterable]s, [List]s, and [Set]s.

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

### removeRandom

The [removeRandom] method removes and returns an element from
the list at random.

```dart
final numbers = [0, 1, 2, 3, 4];
print(numbers.removeFirst()); // 3 (or any of the  other numbers.)
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

## Set Methods

### removeRandom

The [removeRandom] method removes and returns an element from
the set at random.

```dart
final numbers = {0, 1, 2, 3, 4};
print(numbers.removeFirst()); // 3 (or any of the  other numbers.)
print(numbers); // [0, 1, 2, 4]
```

__Note:__ [removeRandom] is included on [List]s and [Set]s, but not [Iterables]
because [Iterable]s lack methods to remove elements without first converting it
to a [List] or [Set].

### + operator

The `+` operator returns a new [Set] by appending the second [Set]'s
values to the end of the first [Set]s'.

```dart
final numbersA = {1, 2, 3};
final numbersB = {4, 5, 6};
print(numbersA + numbersB); // {1, 2, 3, 4, 5, 6}
```
