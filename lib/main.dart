import 'package:destinations_mobile/screens/list_view.dart';
import 'package:destinations_mobile/screens/create_view.dart';
import 'package:destinations_mobile/view_models/destination.dart';
import 'package:destinations_mobile/widgets/destinations_manager.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DestinationsApp());
}

class DestinationsApp extends StatefulWidget {
  const DestinationsApp({super.key});

  @override
  State<DestinationsApp> createState() => _DestinationsAppState();
}

class _DestinationsAppState extends State<DestinationsApp> {
  List<Destination> destinations = [];

  void onAddDestination(Destination destination) {
    setState(() {
      destinations.add(destination);
    });
  }

  void onRemoveDestination(String destinationId) {
    setState(() {
      destinations = destinations.where((d) => d.id != destinationId).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DestinationsManager(
      destinations: destinations,
      child: MaterialApp(
        title: 'Destinations',
        initialRoute: "/",
        routes: {
          "/": (context) => ListScreenView(
                onRemoveDestination: onRemoveDestination,
              ),
          "/create": (context) =>
              CreateView(onAddDestination: onAddDestination),
        },
      ),
    );
  }
}
