## [1.0.3] - July 17, 2022

* Added the shift method to [ListUtilities] and [SetUtilities].

* Made the [end] parameter on [pluck] optional.

## [1.0.2] - July 11, 2022

* Added the [pluck] method to [ListUtilities] and [SetUtilities].

* Added the [removeRange] method to [SetUtilities].

## [1.0.1] - March 26, 2021

* Added the `base_list` library, which exports the [BaseList] class,
an abstract class that implements [List] and all of its methods, intended
to be used as a base class for higher-level implementations of [List].

* Added the [exclude] and [excludeByIndex] methods to [ListUtilities].

* Added the [subset], [exclude], and [excludeByIndex] methods to [SetUtilities].

## [1.0.0] - March 3, 2021

* Migrated to null-safe code.

## [0.1.3] - March 3, 2021

* Added the [getRandom], [transform], [transformAll],
and [count] methods to [ListUtilities].

* Added the [getRandom], [removeFirst] and [removeLast]
methods to [SetUtilities].

* Fixed a bug in [removeLastWhere] in [ListUtilities].

## [0.1.2] - February 1, 2021

* Added the `+` operator to [IterableUtilities].

## [0.1.1] - February 1, 2021

* Moved [equals] from [SetUtilities] to [IterableUtilities], renamed
it to [matches], and added the [ordered] parameter to it.

* Moved [random] from [ListUtilities] to [IterableUtilities].

* Added [removeRandom] to [ListUtilities] and [SetUtilities].

* Added the [removeFirst], [removeFirstWhere] and [removeLastWhere]
methods to [ListUtilities].

## [0.1.0] - January 28, 2021

* Initial release.
