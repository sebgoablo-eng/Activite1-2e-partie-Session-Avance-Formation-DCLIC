class Emission {
  final String id;
  final String nom;
  final String chaineRadio;
  final String cheminImage;

  const Emission({
    required this.id,
    required this.nom,
    required this.chaineRadio,
    required this.cheminImage,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Emission && other.id == id);

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'Emission(id: $id, nom: $nom, chaine: $chaineRadio)';
}
