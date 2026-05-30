import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../models/emission.dart';
import 'carte_emission.dart';

class GrilleEmissions extends StatelessWidget {
  final List<Emission> emissions;
  final void Function(Emission) onTap;

  const GrilleEmissions({
    super.key,
    required this.emissions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    if (emissions.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    return ResponsiveGridList(
      desiredItemWidth: 160,
      minSpacing: 4,
      children: emissions
          .map((e) => CarteEmission(emission: e, onTap: () => onTap(e)))
          .toList(),
    );
  }
}
