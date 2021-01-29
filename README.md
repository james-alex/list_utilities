# list_utilities

A collection of basic extension methods for [Iterable]s, [List]s, and [Set]s.

__See:__ [num_utilities](https://pub.dev/packages/num_utilities)

# Usage

```dart
import 'package:list_utilities/list_utilities.dart';
```

## List Methods

### random

The [random] method returns a random value from the list.

```dart
final list = [0, 1, 2, 3, 4];
print(list.random()); // Prints one of the values in the list at random.
```

### removeNull

The [removeNull] method removes all `null` values from the list.

```dart
final list = [0, 1, null, 3, null];
list.removeNull();
print(list); // [0, 1, 3]
```

### resizeAndFill

The [resizeAndFill] method adds or removes elements from the list,
setting any new values to the provided value.

```dart
final list = [0, 1, 2, 3, 4];
list.resizeAndFill(-2, 0);
print(list); // [0, 1, 2]
list.resizeAndFill(2, 0);
print(list); // [0, 1, 2, 0, 0]
```

### resizeAndGenerate

The [resizeAndGenerate] method adds or removes elements from the list,
setting any new values with the provided generator.

```dart
final list = [0, 1, 2, 3, 4];
list.resizeAndGenerate(5, (index) => index);
print(list); // [0, 1, 2, 3, 4, 0, 1, 2, 3, 4]
list.resizeAndGenerate(-5, (index) => index);
print(list); // [0, 1, 2, 3, 4]
```

### removeFrom

The [removeFrom] method removes the specified number of elements,
starting at the provided index.

```dart
final list = [0, 1, 2, 3, 4];
list.removeFrom(3, 2);
print(list); // [0, 1, 2]
list.removeFrom(0, 2);
print(list); // [2]
```

### removeFromEnd

The [removeFromEnd] method removes the specified number of elements
from the end of the list.

```dart
final list = [0, 1, 2, 3, 4];
list.removeFromEnd(2);
print(list); // [0, 1, 2]
```

## Set Methods

### equals

The [equals] method returns `true` if the other [Set] is the same length
as the calling [Set] and contains all of the same elements, regardless of
their order.

```dart
final setA = {1, 2, 3, 4, 5};
final setB = {5, 4, 3, 2, 1};
print(setA.equals(setB)); // true
```

### + operator

The `+` operator returns a new [Set] by appending the second [Set]'s
values to the end of the first [Set]s'.

```dart
final setA = {1, 2, 3};
final setB = {4, 5, 6};
print(setA + setB); // {1, 2, 3, 4, 5, 6}
```
