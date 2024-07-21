import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hello_depart/app/shared_components/build_liste_tickets.dart';
import 'package:hello_depart/app/shared_components/details_ticket.dart';

import '../../model/client.dart';
import '../../model/ticket.dart';

class ListeTickets extends StatelessWidget {
  const ListeTickets({
    required this.data,
    required this.onPressed,
    Key? key,
  }) : super(key: key);

  final Future<List<Ticket>> data;
  final Function(int index, Client data) onPressed;

  @override
  Widget build(BuildContext context) {

    return FutureBuilder<List<Ticket>>(
        future: data,
        builder: (context, snapshot) {
          print(snapshot);

          if (snapshot.hasData) {
            List<Ticket>? tickets = snapshot.data;

            print(tickets!.length);

            return Column(
                children: List.generate(
                  tickets!.length, (index) =>
                    BuildListTickets(ticket: tickets[index],
                      onPressed: () => {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {

                              //return IconLabel(label: tickets[index].toString(), color: Colors.white, iconData: EvaIcons.inboxOutline,); //
                              return DetailsTicket(tickets[index]);

                            }
                        )
                      },
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
