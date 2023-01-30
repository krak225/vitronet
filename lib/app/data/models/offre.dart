class Comment{
  final int id;
  final int offrenombreposte;
  final String offretitre;
  final String offredescription;
  final String offre_datepublic;
  final String offre_datefin;
  final String entreprise;
  final String offre_image;

  Comment({
    required this.id,
    required this.offrenombreposte,
    required this.offretitre,
    required this.offredescription,
    required this.offre_datepublic,
    required this.offre_datefin,
    required this.entreprise,
    required this.offre_image,

  });

  factory Comment.fromMap(Map<String, dynamic> json) => Comment(
    id: json["offre_id"],
    offrenombreposte: json["offrenombreposte"],
    offretitre: json["offretitre"],
    offredescription: json["offredescription"],
    offre_datepublic: json["offre_datepublic"].toString(),
    offre_datefin: json["offre_datefin"].toString(),
    entreprise: json["offre_statut"],
    offre_image: json["offre_image"],
  );
}