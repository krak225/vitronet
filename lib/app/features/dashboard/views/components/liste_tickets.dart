import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
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

  //final Future<List<Ticket>> data;
  final RxList<Ticket> data;
  final Function(int index, Client data) onPressed;

  @override
  Widget build(BuildContext context) {

    return Column(
        children: List.generate(
          data!.length, (index) =>
            BuildListTickets(ticket: data[index],
              onPressed: () => {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {

                      return DetailsTicket(data[index]);

                    }
                )
              },
            ),
          ),
        );
  }
}
