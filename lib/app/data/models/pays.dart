class Pays{
  final int id;
  final String nom;
  final int indicatif;

  Pays({
    required this.id,
    required this.nom,
    required this.indicatif
  });

  factory Pays.fromMap(Map<String, dynamic> json) => Pays(
    id: json["pays_id"],
    nom: json["nom_fr"],
    indicatif: 225, //json["indicatif"],
  );


}