import 'dart:io';

import 'package:flutter/material.dart';

class ViewImageScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the image path from the route arguments
    final Map<String, dynamic> args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final String imagePath = args['path'] as String;

    return Scaffold(
      appBar: AppBar(
        title: Text('View Image'),
      ),
      body: Center(
        child: Image.file(
          File(imagePath),
          // You can customize the image display properties here
        ),
      ),
    );
  }
}
