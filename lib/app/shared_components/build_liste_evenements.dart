import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../constans/app_color.dart';
import '../constans/app_constants.dart';
import '../features/dashboard/model/evenement.dart';
import '../utils/stdfn.dart';

class BuildListEvenements extends StatelessWidget {
  const BuildListEvenements({
    required this.evenement,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Evenement evenement;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {

    return ListTile(
      contentPadding: EdgeInsets.only(left: 0.0, right: 0.0),
      onTap: onPressed,
      hoverColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadius),
      ),
      leading: _buildIcon(),
      title: _buildTitle(),
      subtitle: _buildSubtitle(),
      trailing: _buildMontantTotal(),
    );

  }

  Widget _buildIcon() {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blueGrey.withOpacity(.1),
      ),
      child: Icon(EvaIcons.creditCard),
    );
  }

  Widget _buildTitle() {
    return Text(
      evenement.evenementLibelle.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Row(children: [
      Text(Stdfn.dateFromDB(evenement.evenementDate!),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      )
    ],);
  }

  Widget _buildMontantTotal() {

    print (evenement.evenementId.toString());
    return Tooltip(
        message: evenement.evenementId.toString(),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            //width: 50.0,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            color: AppColor.black.withOpacity(1),
            child:Text(
              "Ajouter",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        )
    );

  }
}
