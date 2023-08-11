import 'package:destinations_mobile/list_view.dart';
import 'package:destinations_mobile/create_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const DestinationsApp());
}

class DestinationsApp extends StatelessWidget {
  const DestinationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Destinations',
      initialRoute: "/",
      routes: {
        "/": (context) => const ListScreenView(),
        "/create": (context) => const CreateView(),
      },
    );
  }
}
