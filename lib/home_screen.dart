import 'package:flutter/material.dart';

import 'inspection_form_screen.dart';

class HomeScreen extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(title: Text('Inspections')),

      body: Center(

        child: ElevatedButton(

          onPressed: () {

            Navigator.push(

              context,

              MaterialPageRoute(builder: (context) => InspectionFormScreen()),

            );

          },

          child: Text('Start New Inspection'),

        ),

      ),

    );

  }

}