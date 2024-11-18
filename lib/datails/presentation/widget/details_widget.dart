import 'package:flutter/material.dart';

class DetailsWidget extends StatelessWidget {
  const DetailsWidget({super.key, required this.characterId});

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(characterId),
    );
  }
}
