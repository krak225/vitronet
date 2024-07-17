import 'package:flutter/material.dart';

import '../config/app_constants.dart';
import '../constans/app_color.dart';
import '../constans/app_constants.dart';
import '../features/dashboard/model/hellodepart_models.dart';
import '../utils/stdfn.dart';

class BuildListDeparts extends StatelessWidget {
  const BuildListDeparts({
    required this.depart,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Depart depart;
  final Function() onPressed;
  final Function()? onPressedAssign;
  final Function()? onPressedMember;

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
      trailing: _buildAssign(),
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
      child: Image.network(AppConstants.COMPAGNIE_URL + depart.compagnie!.compagnieLogo!, fit: BoxFit.contain)//data.icon,
    );
  }

  Widget _buildTitle() {
    return Text(
      depart.ligne!.ligneDesignation.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {

    var heure_arrivee = (depart!.departHeureArrivee != null)? " - " + depart!.departHeureArrivee.toString().substring(0, 5) : '';

    return Row(children: [
      Expanded(
        child: Text(
            Stdfn.dateFromDB(depart!.departDatePrevue!),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      Expanded(
        child: Text(
          depart.departHeurePrevue!.substring(0, 5) + heure_arrivee,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      )
    ],);
  }

  Widget _buildAssign() {

    return Tooltip(
              message: depart.ligne!.ligneKilometrage!.toString(),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                child: Container(
                    //width: 50.0,
                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                    color: AppColor.amber.withOpacity(1),
                    child:Text(
                      Stdfn.toAmount(int.parse(depart!.departTarif!.toString())),
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
