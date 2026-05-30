import 'dart:math';
import 'package:flutter/foundation.dart';
import '../models/diffusion.dart';
import '../models/emission.dart';

class EmissionController {
  final ValueNotifier<List<Emission>> emissions = ValueNotifier([]);
  final ValueNotifier<Emission?> emissionSelectionnee = ValueNotifier(null);

  static const List<Map<String, String>> _catalogue = [
    {
      'id': 'doc',
      'nom': 'Documentaires',
      'chaine': 'Radio 4',
      'image': 'assets/images/documentaires.jpeg',
    },
    {
      'id': 'mode',
      'nom': 'Tendances Mode',
      'chaine': 'Radio 3',
      'image': 'assets/images/mode.jpeg',
    },
    {
      'id': 'crime',
      'nom': 'Enquêtes Criminelles',
      'chaine': 'Radio 2',
      'image': 'assets/images/crime.jpeg',
    },
    {
      'id': 'foot',
      'nom': 'Match de Foot',
      'chaine': 'Radio 5',
      'image': 'assets/images/foot.jpeg',
    },
    {
      'id': 'meteo',
      'nom': 'Streaming Météo',
      'chaine': 'Radio 1',
      'image': 'assets/images/meteo.jpeg',
    },
    {
      'id': 'news',
      'nom': 'Que des news',
      'chaine': 'Radio 4',
      'image': 'assets/images/news.jpeg',
    },
  ];

  void loadEmissions() {
    emissions.value = _catalogue
        .map(
          (e) => Emission(
            id: e['id']!,
            nom: e['nom']!,
            chaineRadio: e['chaine']!,
            cheminImage: e['image']!,
          ),
        )
        .toList();
  }

  List<Emission> getEmissions() => List.unmodifiable(emissions.value);

  Emission onEmissionSelected(Emission emission) {
    emissionSelectionnee.value = emission;
    return emission;
  }

  List<Diffusion> genererDiffusions(Emission emission, {int nombre = 5}) {
    final rng = Random(emission.id.hashCode);
    final baseAnnee = 2023;

    final liste = List.generate(nombre, (i) {
      final mois = rng.nextInt(12) + 1;
      final jour = rng.nextInt(28) + 1;
      return Diffusion(
        label: 'Diffusion ${i + 1}',
        date: DateTime(baseAnnee, mois, jour),
      );
    });

    liste.sort((a, b) => b.date.compareTo(a.date));
    return liste;
  }

  void dispose() {
    emissions.dispose();
    emissionSelectionnee.dispose();
  }
}
