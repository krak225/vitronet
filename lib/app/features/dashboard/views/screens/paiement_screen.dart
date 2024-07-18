
import 'package:cinetpay/cinetpay.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../utils/ui/theme/snackbar_ui.dart';
import '../../controllers/home_controller.dart';

class PaiementScreen extends GetView<HomeController> {
  final String transaction_id;
  final int facture_id;
  final int montant;

  const PaiementScreen({
    required this.transaction_id,
    required this.facture_id,
    required this.montant,
    Key? key,
  }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    return CinetPayCheckout(
      title: 'Guichet TicketPlus',
      configData: <String, dynamic> {
        'apikey': '1114703932630f91ed741316.24658063',
        'site_id': '174242',
        'notify_url': 'https://hellodepart.com/pointventenotify',
        'mode':'PRODUCTION'
      },
      paymentData: <String, dynamic> {
        'transaction_id': transaction_id,
        'amount': montant,
        'currency': 'XOF',
        'channels': 'ALL',
        'description': 'Test Achat de ticket HelloDepart',
      },
      waitResponse: (data) {
        SnackbarUi.success(data.toString());
      },
      onError: (data) {
        SnackbarUi.error(data.toString());
      },
    );
  }

}

