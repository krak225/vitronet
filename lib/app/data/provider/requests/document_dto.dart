import 'dart:io' as Io;

class DocumentDto{
   String? code;
   String? name;
   String? icon;
   String? type;
   bool status;
   Io.File? file;

  DocumentDto({
    this.code,
    this.name,
    this.type,
    this.status = false,
    this.icon,
    this.file,
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