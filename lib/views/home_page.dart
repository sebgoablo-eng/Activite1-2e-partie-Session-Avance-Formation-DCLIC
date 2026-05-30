import 'package:flutter/material.dart';
import '../controllers/emission_controller.dart';
import '../models/emission.dart';
import 'detail_page.dart';
import 'grille_emissions.dart';

class HomePage extends StatefulWidget {
  final EmissionController controller;

  const HomePage({super.key, required this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _indexOngletActif = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.loadEmissions();
  }

  void _naviguerVersDetail(Emission emission) {
    final emissionChoisie = widget.controller.onEmissionSelected(emission);
    final diffusions = widget.controller.genererDiffusions(emissionChoisie);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) =>
            DetailPage(emission: emissionChoisie, diffusions: diffusions),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: const Icon(Icons.search, color: Colors.black),
        title: const Text(
          'Vos émissions en streaming',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.menu, color: Colors.black),
          ),
        ],
      ),
      body: ValueListenableBuilder<List<Emission>>(
        valueListenable: widget.controller.emissions,
        builder: (_, liste, __) => Center(
          child: GrilleEmissions(emissions: liste, onTap: _naviguerVersDetail),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexOngletActif,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.grey,
        onTap: (index) => setState(() => _indexOngletActif = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
