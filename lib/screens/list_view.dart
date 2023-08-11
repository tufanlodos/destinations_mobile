import 'package:destinations_mobile/services/directions_helper.dart';
import 'package:destinations_mobile/widgets/destinations_manager.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

typedef OnRemoveDestination = void Function(String destinationId);

class ListScreenView extends StatefulWidget {
  final OnRemoveDestination onRemoveDestination;

  const ListScreenView({super.key, required this.onRemoveDestination});

  @override
  State<ListScreenView> createState() => _ListScreenViewState();
}

class _ListScreenViewState extends State<ListScreenView> {
  @override
  Widget build(BuildContext context) {
    final destinations = DestinationsManager.of(context).destinations;
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Title(
                  color: Colors.black,
                  child: const Text("Welcome to your destination manager!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ))),
            ),
            if (destinations.isEmpty)
              const Center(child: Text("There is no destination"))
            else
              for (var destination in destinations)
                ListTile(
                    title: Text(destination.name),
                    subtitle: Text(
                        "${destination.latitude},${destination.longitude}"),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.directions, color: Colors.black),
                          onPressed: () async {
                            final directionsUrl =
                                DirectionsHelper.getSchemeAndURL(
                                    destination.latitude.toString(),
                                    destination.longitude.toString());
                            final Uri url = Uri.parse(directionsUrl);
                            launchUrl(url);
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete, color: Colors.black),
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              content: Text(
                                  'Do you want to remove "${destination.name}?"'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text(
                                    'No',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    widget.onRemoveDestination(destination.id);
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('Yes',
                                      style: TextStyle(color: Colors.red)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "/create");
          },
          backgroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
