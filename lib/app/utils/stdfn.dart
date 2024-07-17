import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../features/dashboard/model/facture.dart';

class Stdfn {

  static String uiid() {

    String uiid = Uuid().v4();

    return uiid;
  }

  static String toAmount(int number){
    var formatter = new NumberFormat("#,###");
    return formatter.format(number).replaceAll(",", " ");
  }

  static String dateFromDB(String dateStr) {
    DateTime date = DateTime.parse(dateStr);

    String formattedDate = DateFormat('dd/MM/yyyy').format(date);

    return formattedDate;
  }

  static String dateTimeFromDB(String dateStr) {
    DateTime date = DateTime.parse(dateStr);

    String formattedDate = DateFormat('dd/MM/yyyy à HH:mm').format(date);

    return formattedDate;
  }

  static sumTotalFactures(Iterable<Facture> factures) {
    int total = 0;

    for(Facture facture in factures){
      total += int.parse(facture.factureMontantTotal.toString());
    }

    return total;

  }

}
