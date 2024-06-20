import 'package:flutter/material.dart';

class CustomAppLoader extends StatelessWidget {
  const CustomAppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
