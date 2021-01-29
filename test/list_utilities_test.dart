import 'dart:math';
import 'package:collection/collection.dart';
import 'package:test/test.dart';
import 'package:list_utilities/list_utilities.dart';

void main() {
  group('List', () {
    test('random', () {
      final list = <int>[0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
      while (list.isNotEmpty) {
        list.remove(list.random());
      }
    });

    test('removeNull', () {
      final random = Random();

      for (var i = 0; i < 100; i++) {
        final list =
            List<int>.generate(100, (index) => random.nextBool() ? i : null);
        final nullValues = list.where((element) => element == null).length;
        list.removeNull();
        expect(list.length, equals(100 - nullValues));
      }
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
  });

  group('SetUtilities', () {
    final sets = <Set<int>>[
      {1, 2, 3, 4, 5},
      {6, 7, 8, 9, 10},
      {5, 4, 3, 2, 1},
      {10, 9, 8, 7, 6},
    ];

    test('equals', () {
      for (var i = 0; i < sets.length; i++) {
        for (var j = 0; j < sets.length; j++) {
          final setsAreEqual = sets[i].equals(sets[j]);
          if (i == j || (i.isEven && j.isEven) || (i.isOdd && j.isOdd)) {
            expect(setsAreEqual, equals(true));
          } else {
            expect(setsAreEqual, equals(false));
          }
        }
      }
    });

    test('+', () {
      sets.reduce((a, b) => a + b).equals({1, 2, 3, 4, 5, 6, 7, 8, 9, 10});
    });
  });
}
