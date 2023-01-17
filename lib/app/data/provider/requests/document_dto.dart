class DocumentDto{
  final String? code;
  final String? name;
  final String? icon;
  final String? type;
  final bool status;

  DocumentDto({
    this.code,
    this.name,
    this.type,
    this.status = false,
    this.icon,
  });

  // factory DocumentDto.fromJson(Map<String, dynamic> json) => DocumentDto(
  //   id: json["id"],
  //   name: json["name"],
  //   description: json["description"],
  //   url: json["url"],
  //   type: json["type"],
  //   status: json["status"],
  //   createdAt: json["createdAt"],
  //   updatedAt: json["updatedAt"],
  // );
  //
  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "description": description,
  //   "url": url,
  //   "type": type,
  //   "status": status,
  //   "createdAt": createdAt,
  //   "updatedAt": updatedAt,
  // };
}