import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';

import '../constans/app_color.dart';
import '../constans/app_constants.dart';
import '../features/dashboard/model/facture.dart';
import '../features/dashboard/model/ticket.dart';
import '../utils/stdfn.dart';

class BuildListTickets extends StatelessWidget {
  const BuildListTickets({
    required this.ticket,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Ticket ticket;
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
      ticket.ticketQrcode.toString(),
      style: const TextStyle(fontWeight: FontWeight.bold),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle() {
    return Text("Qté: 1, PU: 100",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildMontantTotal() {

    print (ticket.ticketMontant.toString());
    return Tooltip(
        message: ticket.ticketMontant.toString(),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          child: Container(
            //width: 50.0,
            padding: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
            color: AppColor.orange.withOpacity(1),
            child:Text(
              Stdfn.toAmount(int.parse(ticket.ticketMontant.toString())) +" F",
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
              textAlign: TextAlign.right,
            ),
          ),
        )
    );

  }
}
