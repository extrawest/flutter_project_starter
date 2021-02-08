import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';

bool useVibration = true;

/// Use this method if you need to map a collection and track index of item
///
/// Example usage:
///     List<String> items = ['a', 'b', 'c', 'd', 'e'];
///
///     // iterate over the list of items and map every value to a new string, for example
///     List<String> mappedStrings = indexedMap(items, (index, item) {
///       return 'Item is: $item, index of this item is: $index';
///     }).toList();
///
///     print(mappedStrings);
///
///     OUTPUT:
///     ['Item is: a, index of this item is: 0', 'Item is: b, index of this item is: 1', 'Item is: c, index of this item is: 2', ...]
Iterable<E> indexedMap<E, T>(Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;
  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}

class ApplicationUtils {
  static Future<String> getDeviceUdId() async {
    try {
      return await FlutterUdid.udid;
    } on PlatformException catch (e) {
      print('getDeviceUdId PlatformException: $e');
      return null;
    }
  }

  static void vibrate() {
    if (useVibration) {
      HapticFeedback.selectionClick();
    }
  }
}
