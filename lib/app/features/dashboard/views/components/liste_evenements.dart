import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_depart/app/shared_components/build_liste_evenements.dart';
import 'package:hello_depart/app/shared_components/build_liste_tickets.dart';
import 'package:hello_depart/app/shared_components/details_evenement.dart';
import 'package:hello_depart/app/shared_components/details_ticket.dart';

import '../../model/client.dart';
import '../../model/evenement.dart';
import '../../model/ticket.dart';

class ListeEvenements extends StatelessWidget {
  const ListeEvenements({
    required this.data,
    Key? key,
  }) : super(key: key);

  final Future<List<Evenement>> data;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Evenement>>(
        future: data,
        builder: (context, snapshot) {
          print(snapshot);

          if (snapshot.hasData) {
            List<Evenement>? evenements = snapshot.data;

            print(evenements!.length);

            return Column(
                children: List.generate(
                  evenements!.length, (index) =>
                    BuildListEvenements(evenement: evenements[index],
                      onPressed: () => {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {

                              //return IconLabel(label: tickets[index].toString(), color: Colors.white, iconData: EvaIcons.inboxOutline,); //
                              return DetailsEvenement(evenements[index]);

                            }
                        )
                      },
                    ),
                  ),
                );

          } else if (snapshot.hasError) {
            return Text("AUCUN EVENEMENT TROUVE");//"${snapshot.error}"
          }
          return Center(child: CircularProgressIndicator());
        },
    );


  }
}
