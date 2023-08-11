import 'package:flutter/material.dart';

class ListScreenView extends StatefulWidget {
  const ListScreenView({super.key});

  @override
  State<ListScreenView> createState() => _ListScreenViewState();
}

class _ListScreenViewState extends State<ListScreenView> {
  @override
  Widget build(BuildContext context) {
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
            const ListTile(
              title: Text("Destination 1"),
              subtitle: Text("Destination 1 subtitle"),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.directions, color: Colors.black),
                    onPressed: null,
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.black),
                    onPressed: null,
                  ),
                ],
              ),
            ),
            const ListTile(
                title: Text("Destination 2"),
                subtitle: Text("Destination 2 subtitle"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.directions, color: Colors.black),
                      onPressed: null,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: null,
                    ),
                  ],
                )),
            const ListTile(
                title: Text("Destination 3"),
                subtitle: Text("Destination 3 subtitle"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.directions, color: Colors.black),
                      onPressed: null,
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.black),
                      onPressed: null,
                    ),
                  ],
                )),
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
