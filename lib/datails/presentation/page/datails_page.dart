import 'package:flutter/material.dart';
import 'package:ricka_and_morty/datails/presentation/widget/details_widget.dart';

class DatailsPage extends StatelessWidget {
  const DatailsPage({super.key, required this.characterId});

  final String characterId;

  @override
  Widget build(BuildContext context) {
    return DetailsWidget(characterId: characterId);
  }
}
