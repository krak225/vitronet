import 'package:flutter/material.dart';

import '../../../../data/provider/requests/document_dto.dart';
import '../../../theme/light_color.dart';

class DocumentItemBoxWidget extends StatelessWidget {
  final DocumentDto doc;
  final dynamic onTap;

  const DocumentItemBoxWidget({Key? key, required this.doc, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( vertical: 10),
      decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: LightColor.grey,
          width: 0.5,
        ),
      )
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(0),
        onTap: onTap,
        title: Text(
          "${doc.name}",
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.normal,
            color: LightColor.grey,
          ),
        ),
        leading: Container(
          width: 58,
          height: 48,
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: doc.status ? LightColor.secondAccent : Colors.white,
            borderRadius: BorderRadius.circular(7),
            boxShadow: [
              BoxShadow(
                color: LightColor.lightGrey2,
                blurRadius: 3,
                offset: Offset(0, 4),
              )
            ],
          ),
          child: Image.asset(
            "${doc.icon}",
            color: doc.status ? Colors.black : null,
          ),
        ),
      ),
    );
  }
}
