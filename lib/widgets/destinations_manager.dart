import 'package:flutter/foundation.dart';
import 'package:destinations_mobile/view_models/destination.dart';
import 'package:flutter/material.dart';

class DestinationsManager extends InheritedWidget {
  final List<Destination> destinations;

  const DestinationsManager({
    Key? key,
    required this.destinations,
    required Widget child,
  }) : super(key: key, child: child);

  static DestinationsManager of(BuildContext context) {
    final DestinationsManager? result =
        context.dependOnInheritedWidgetOfExactType<DestinationsManager>();
    assert(result != null, 'No DestinationsManager found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DestinationsManager oldWidget) {
    return listEquals(destinations, oldWidget.destinations) == false;
  }
}
