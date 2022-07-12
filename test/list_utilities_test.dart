import 'dart:math';
import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:list_utilities/list_utilities.dart';

void main() {
  group('ListUtilities', () {
    test('random', () {
      final list = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      while (list.isNotEmpty) {
        list.remove(list.random());
      }
    });

    test('getRandom', () {
      final list = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      final randomElements = list.getRandom(5);
      expect(randomElements.toSet().length == 5, true);
    });

    test('removeRandom', () {
      final list = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      while (list.isNotEmpty) {
        list.removeRandom();
      }
    });

    test('removeNull', () {
      final random = Random();

      for (var i = 0; i < 100; i++) {
        final list =
            List<int?>.generate(100, (index) => random.nextBool() ? i : null);
        final nullValues = list.where((element) => element == null).length;
        list.removeNull();
        expect(list.length, equals(100 - nullValues));
      }
    });

    test('removeFirst', () {
      final list = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      for (var i = 1; i <= 10; i++) {
        final first = list.first;
        expect(list.removeFirst(), equals(first));
        expect(list.length, equals(10 - i));
      }
      expect(list.isEmpty, equals(true));
    });

    test('removeFirstWhere', () {
      final list = <int>[0, 1, 2, 3, 4];
      list.removeFirstWhere((value) => value.isOdd);
      expect(list, orderedEquals(<int>[0, 2, 3, 4]));
    });

    test('removeLastWhere', () {
      final list = <int>[0, 1, 2, 3, 4];
      list.removeLastWhere((value) => value.isOdd);
      expect(list, orderedEquals(<int>[0, 1, 2, 4]));
    });

    test('resizeAndFill', () {
      final list = List<int>.filled(5, 0, growable: true);
      list.resizeAndFill(5, 0);
      expect(list.length, equals(10));
      expect(list.every((value) => value == 0), equals(true));
      list.resizeAndFill(-5, 0);
      expect(list.length, equals(5));
      list.resizeAndFill(-5, 0);
      expect(list.length, equals(0));
      list.resizeAndFill(5, 0);
      expect(list.length, equals(5));
      expect(list.every((value) => value == 0), equals(true));
    });

    test('resizeAndGenerate', () {
      final list = List<int>.generate(5, (index) => index);
      list.resizeAndGenerate(5, (index) => 5 + index);
      expect(
          list.equals(List<int>.generate(10, (index) => index)), equals(true));
      list.resizeAndGenerate(-5, (index) => 5 + index);
      expect(
          list.equals(List<int>.generate(5, (index) => index)), equals(true));
      list.resizeAndGenerate(-5, (index) => index);
      expect(list.length, equals(0));
      list.resizeAndGenerate(5, (index) => index);
      expect(
          list.equals(List<int>.generate(5, (index) => index)), equals(true));
    });

    test('removeFrom', () {
      final list = List<int>.generate(10, (index) => index);
      list.removeFrom(0, 5);
      expect(list.equals(List<int>.generate(5, (index) => 5 + index)),
          equals(true));
      list.removeFrom(3, 2);
      expect(list.equals(List<int>.generate(3, (index) => 5 + index)),
          equals(true));
    });

    test('removeFromEnd', () {
      final list = List<int>.generate(10, (index) => index);
      list.removeFromEnd(5);
      expect(
          list.equals(List<int>.generate(5, (index) => index)), equals(true));
      list.removeFromEnd(5);
      expect(list.length, equals(0));
    });

    test('equals', () {
      final lists = <List<int>>[
        [1, 2, 3, 4, 5],
        [6, 7, 8, 9, 10],
        [5, 4, 3, 2, 1],
        [10, 9, 8, 7, 6],
      ];

      for (var i = 0; i < lists.length; i++) {
        for (var j = 0; j < lists.length; j++) {
          final listsAreEqual = lists[i].matches(lists[j]);
          if (i == j || (i.isEven && j.isEven) || (i.isOdd && j.isOdd)) {
            expect(listsAreEqual, equals(true));
            if (i != j) {
              expect(lists[i].matches(lists[j], ordered: true), equals(false));
            } else {
              expect(lists[i].matches(lists[j], ordered: true), equals(true));
            }
          } else {
            expect(listsAreEqual, equals(false));
          }
        }
      }
    });

    test('transform', () {
      final list = <int>[0, 1, 2, 3, 4];
      list.transform(2, (element) => element * 2);
      expect(list, equals(<int>[0, 1, 4, 3, 4]));
    });

    test('transformAll', () {
      final list = <int>[0, 1, 2, 3, 4];
      list.transformAll((element) => element * 2);
      expect(list, equals(<int>[0, 2, 4, 6, 8]));
    });

    test('count', () {
      final list = <int>[0, 1, 2, 0, 1, 0];
      expect(list.count(0), equals(3));
      expect(list.count(1), equals(2));
      expect(list.count(2), equals(1));
    });
  });

  group('SetUtilities', () {
    final sets = <Set<int>>[
      {1, 2, 3, 4, 5},
      {6, 7, 8, 9, 10},
      {5, 4, 3, 2, 1},
      {10, 9, 8, 7, 6},
    ];

    test('random', () {
      final numbers = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
      while (numbers.isNotEmpty) {
        numbers.remove(numbers.random());
      }
    });

    test('getRandom', () {
      final numbers = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
      final randomNumbers = numbers.getRandom(5);
      expect(randomNumbers.length, equals(5));
    });

    test('removeRandom', () {
      final numbers = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
      while (numbers.isNotEmpty) {
        numbers.removeRandom();
      }
    });

    test('removeFirst', () {
      final numbers = <int>{0, 1, 2, 3, 4};
      expect(numbers.removeFirst(), equals(0));
      expect(numbers.length, equals(4));
    });

    test('removeLast', () {
      final numbers = <int>{0, 1, 2, 3, 4};
      expect(numbers.removeLast(), equals(4));
      expect(numbers.length, equals(4));
    });

    test('removeRange', () {
      final numbers = <int>{0, 1, 2, 3, 4, 5, 6, 7, 8, 9};
      numbers.removeRange(3, 8);
      expect(numbers, orderedEquals(<int>{0, 1, 2, 8, 9}));
    });

    test('equals', () {
      for (var i = 0; i < sets.length; i++) {
        for (var j = 0; j < sets.length; j++) {
          final setsAreEqual = sets[i].matches(sets[j]);
          if (i == j || (i.isEven && j.isEven) || (i.isOdd && j.isOdd)) {
            expect(setsAreEqual, equals(true));
            if (i != j) {
              expect(sets[i].matches(sets[j], ordered: true), equals(false));
            } else {
              expect(sets[i].matches(sets[j], ordered: true), equals(true));
            }
          } else {
            expect(setsAreEqual, equals(false));
          }
        }
      }
    });

    test('+', () {
      sets
          .reduce((a, b) => a + b)
          .matches({1, 2, 3, 4, 5, 6, 7, 8, 9, 10}, ordered: true);
    });
  });
}
