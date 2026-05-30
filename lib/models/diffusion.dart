class Diffusion {
  final String label;
  final DateTime date;

  const Diffusion({required this.label, required this.date});

  String get dateFormatee {
    final m = date.month.toString().padLeft(2, '0');
    final j = date.day.toString().padLeft(2, '0');
    return '${date.year}-$m-$j';
  }

  @override
  String toString() => 'Diffusion($label, $dateFormatee)';
}
