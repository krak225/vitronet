import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../shared_components/build_liste_departs.dart';
import '../../../../shared_components/form_reserver_ticket.dart';
import '../../model/client.dart';
import '../../model/hellodepart_models.dart';

class ListeDeparts extends StatelessWidget {
  const ListeDeparts({
    required this.data,
    required this.onPressed,
    required this.onPressedAssign,
    required this.onPressedMember,
    Key? key,
  }) : super(key: key);

  final Future<List<Depart>> data;
  final Function(int index, Client data) onPressed;
  final Function(int index, Client data) onPressedAssign;
  final Function(int index, Client data) onPressedMember;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Depart>>(
        future: data,
        builder: (context, snapshot) {

          print(snapshot);

          if (snapshot.hasData) {
            List<Depart>? departs = snapshot.data;

            return Column(
                children: List.generate(
                  departs!.length, (index) =>
                    BuildListDeparts(
                      depart: departs[index],
                      onPressed: () =>{
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            isDismissible: false,
                            builder: (context) {

                              return  WillPopScope(
                                  onWillPop: () async => false,
                                  child:FormReserverTicket(departs![index])
                              );

                            }
                        )
                        /*showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          isScrollControlled: true,
                          isDismissible: false,
                          builder: (context) {

                            return FormReserverTicket(departs![index]);

                          }
                        )*/
                      },
                      onPressedAssign: () => {},
                      onPressedMember: () => {},
                    ),
                  ),
                );

          } else if (snapshot.hasError) {
            return Text("AUCUN TICKET TROUVE");//"${snapshot.error}"
          }
          return Center(child: CircularProgressIndicator());
        },
    );


  }
}
