import 'package:flutter/material.dart';
import '../models/diffusion.dart';
import '../models/emission.dart';

class DetailPage extends StatelessWidget {
  final Emission emission;
  final List<Diffusion> diffusions;

  const DetailPage({
    super.key,
    required this.emission,
    required this.diffusions,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: Colors.deepPurple,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.white),
                onPressed: () {},
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: emission.id,
                child: Image.asset(
                  emission.cheminImage,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => Container(
                    color: Colors.deepPurple[200],
                    child: const Icon(
                      Icons.image_not_supported,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              color: Colors.deepPurple,
              padding: const EdgeInsets.fromLTRB(20, 14, 20, 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    emission.nom,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    emission.chaineRadio,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) =>
                    _TuileDiffusion(diffusion: diffusions[index]),
                childCount: diffusions.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _TuileDiffusion extends StatelessWidget {
  final Diffusion diffusion;

  const _TuileDiffusion({required this.diffusion});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text('${diffusion.label} - ', style: const TextStyle(fontSize: 14)),
          IconButton(
            icon: const Icon(Icons.volume_up, size: 20),
            onPressed: () {},
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
          ),
          const SizedBox(width: 6),
          Text(
            'Date: ${diffusion.dateFormatee}',
            style: const TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
