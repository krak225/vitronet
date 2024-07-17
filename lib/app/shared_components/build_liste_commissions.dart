import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../constans/app_color.dart';
import '../constans/app_constants.dart';
import '../features/dashboard/model/facture.dart';
import '../utils/stdfn.dart';

class BuildListCommissions extends StatelessWidget {
  const BuildListCommissions({
    required this.facture,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Facture facture;
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
      facture.factureNomprenomspassager.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text("Sur facture N°" + facture.factureId.toString() + " du " + Stdfn.dateFromDB(facture.factureDateCreation!),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMontantTotal() {

    print (facture.facturePartpdv.toString());
    return Tooltip(
        message: facture.facturePartpdv.toString(),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            //width: 50.0,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            color: AppColor.amber.withOpacity(1),
            child:Text(
              Stdfn.toAmount(int.parse(facture.facturePartpdv.toString()))+" F",
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
