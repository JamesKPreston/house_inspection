import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';

import 'dart:io';

class InspectionFormScreen extends StatefulWidget {

  @override

  _InspectionFormScreenState createState() => _InspectionFormScreenState();

}

class _InspectionFormScreenState extends State<InspectionFormScreen> {

  final addressController = TextEditingController();

  String occupancyStatus = 'Occupied';

  String structureType = 'Single-family';

  List<XFile>? images;

  void pickImages() async {

    final ImagePicker picker = ImagePicker();

    final pickedImages = await picker.pickMultiImage();

    setState(() {

      images = pickedImages;

    });

  }

  void submitInspection() async {

    final response = await Supabase.instance.client.from('inspections').insert({

      'address': addressController.text,

      'occupancy_status': occupancyStatus,

      'structure_type': structureType,

      'images': images?.map((e) => e.path).toList(), // Update for storage

    });

    if (response.error == null) {

      ScaffoldMessenger.of(context).showSnackBar(

        SnackBar(content: Text('Inspection submitted successfully!')),

      );

    }

  }

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Inspection Form')),

      body: Padding(

        padding: const EdgeInsets.all(16.0),

        child: ListView(

          children: [

            TextField(

              controller: addressController,

              decoration: InputDecoration(labelText: 'Property Address'),

            ),

            DropdownButtonFormField(

              value: occupancyStatus,

              items: ['Occupied', 'Vacant', 'Unknown']

                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))

                  .toList(),

              onChanged: (value) => setState(() => occupancyStatus = value!),

            ),

            DropdownButtonFormField(

              value: structureType,

              items: ['Single-family', 'Multi-family', 'Commercial']

                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))

                  .toList(),

              onChanged: (value) => setState(() => structureType = value!),

            ),

            ElevatedButton(onPressed: pickImages, child: Text('Add Photos')),

            if (images != null)

              Wrap(

                children: images!.map((img) => Image.file(File(img.path), height: 100)).toList(),

              ),

            ElevatedButton(onPressed: submitInspection, child: Text('Submit')),

          ],

        ),

      ),

    );

  }

}