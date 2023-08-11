import 'package:destinations_mobile/view_models/destination.dart';
import 'package:flutter/material.dart';

typedef OnAddDestination = void Function(Destination destination);
final latLonRegex = RegExp(r'^-?[0-9]{1,3}(?:\.[0-9]{1,10})?$');

class CreateView extends StatefulWidget {
  final OnAddDestination onAddDestination;

  const CreateView({super.key, required this.onAddDestination});

  @override
  State<CreateView> createState() => _CreateViewState();
}

class _CreateViewState extends State<CreateView> {
  String name = "";
  String latitude = "";
  String longitude = "";

  String error = "";

  _onSave() {
    if (name.isEmpty || latitude.isEmpty || longitude.isEmpty) {
      setState(() {
        error = "Name, latitude and longitude are required";
      });
      return;
    }

    try {
      final latitude = double.parse(this.latitude);
      final longitude = double.parse(this.longitude);

      latLonRegex.hasMatch(this.latitude) &&
              latLonRegex.hasMatch(this.longitude)
          ? null
          : throw Exception();

      if (latitude < -90 ||
          latitude > 90 ||
          longitude < -180 ||
          longitude > 180) {
        throw Exception();
      }

      widget.onAddDestination(Destination(
          id: DateTime.now().toString(),
          name: name,
          latitude: latitude,
          longitude: longitude));
      Navigator.pop(context);
    } catch (e) {
      setState(() {
        error = "Invalid latitude or longitude";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("Add destination"),
        backgroundColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                      color: Colors.black,
                      child: const Text(
                        "Name",
                        textAlign: TextAlign.left,
                      )),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Name',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                    onChanged: (value) {
                      setState(() {
                        name = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                      color: Colors.black,
                      child: const Text(
                        "Latitude",
                        textAlign: TextAlign.left,
                      )),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Latitude',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                    onChanged: (value) {
                      setState(() {
                        latitude = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Title(
                      color: Colors.black,
                      child: const Text(
                        "Longitude",
                        textAlign: TextAlign.left,
                      )),
                  TextField(
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Longitude',
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black),
                        )),
                    onChanged: (value) {
                      setState(() {
                        longitude = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            if (error.isNotEmpty)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  error,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            Expanded(
                child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.red),
                      ),
                      child: const Text(
                        "Cancel",
                      )),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: ElevatedButton(
                    onPressed: _onSave,
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15)),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    ));
  }
}
