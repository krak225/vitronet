class Region {
  int regionId;
  String regionNom;

  Region({
    required this.regionId,
    required this.regionNom,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      regionId: json['region_id'],
      regionNom: json['region_nom']
    );
  }
}