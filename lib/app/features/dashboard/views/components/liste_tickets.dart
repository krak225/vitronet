import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared_components/build_liste_factures.dart';
import '../../../../shared_components/details_facture.dart';
import '../../model/client.dart';
import '../../model/facture.dart';

class ListeTickets extends StatelessWidget {
  const ListeTickets({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Future<List<Facture>> data;
  final Function(int index, Client data) onPressed;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Facture>>(
        future: data,
        builder: (context, snapshot) {
          print(snapshot);

          if (snapshot.hasData) {
            List<Facture>? factures = snapshot.data;

            print(factures!.length);

            return Column(
                children: List.generate(
                  factures!.length, (index) =>
                    BuildListFactures(facture: factures[index],
                      onPressed: () => {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {

                              return DetailsFacture(factures[index]);

                            }
                        )
                      },
                    ),
                  ),
                );

          } else if (snapshot.hasError) {
            return Text("AUCUN TICKET VERIFIE");//"${snapshot.error}"
          }
          return Center(child: CircularProgressIndicator());
        },
    );


  }
}
