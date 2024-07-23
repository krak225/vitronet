import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../../config/routes/app_pages.dart';
import '../../../../constans/app_color.dart';
import '../../controllers/password_reset_controller.dart';
class ResetPasswordScreen extends GetView<ResetPasswordController> {
  ResetPasswordScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> _homeKey = GlobalKey<FormState>(debugLabel: '_homeScreenkey');

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //key: _homeKey,
      backgroundColor: AppColor.yellow.withOpacity(1),
      body: SafeArea(
        top: false,
        bottom: false,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Padding(padding: EdgeInsets.only(top: 150)),
                Text('Réinitialisation de mot de passe', style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                ),
                SizedBox(height: 10,),
                /*FadeInRight(
                    delay: Duration(milliseconds: 0),
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10,),
                      ),
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10,),
                        ),
                        child: Image.asset('assets/images/logo.jpeg'),
                      ),
                    ),
                ),*/
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10,),
                  ),
                  child: Text("Entrez le code reçu par mail/sms, et définissez un nouveau mot de passe.", style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 0),
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                        alignment: Alignment.bottomCenter,
                        //margin: EdgeInsets.symmetric(horizontal: 16.0,),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular( 16,),
                        ),
                        child:FormBuilder(
                          key: controller.formKey,
                          ///initialValue: controller.initValues,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: SingleChildScrollView(
                            //padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      FadeInRight(
                                        delay: Duration(milliseconds: 300),
                                        child: FormBuilderTextField(
                                          name: "code",
                                          initialValue: "",
                                          decoration: InputDecoration(labelText: "Code de réinitialisation"),
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            //_username = value!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Code de réinitialisation requis';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      FadeInRight(
                                        delay: Duration(milliseconds: 300),
                                        child:FormBuilderTextField(
                                          name: "password",
                                          initialValue: "",
                                          decoration: InputDecoration(labelText: "Nouveau Mot de passe"),
                                          obscureText: true,
                                          onSaved: (value) {
                                            //_password = value!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Nouveau Mot de passe requis';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      FadeInRight(
                                        delay: Duration(milliseconds: 300),
                                        child:FormBuilderTextField(
                                          name: "password_confirmation",
                                          initialValue: "",
                                          decoration: InputDecoration(labelText: "Confirmer le mot de passe"),
                                          obscureText: true,
                                          onSaved: (value) {
                                            //_password = value!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Confirmer le mot de passe';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      const SizedBox(height: 20.0),
                                      FadeInRight(
                                        delay: Duration(milliseconds: 300),
                                        child:Center(
                                          child: ElevatedButton.icon(
                                            onPressed: () => controller.reset_password(),
                                            icon: Icon(Icons.arrow_forward),
                                            label: Text('Réinitialiser', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),),
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size.fromHeight(40),
                                              backgroundColor: Colors.black,// fromHeight use double.infinity as width and 40 is the height
                                              foregroundColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            /*Flexible(
                                              child: TextButton(
                                                onPressed: () => {},
                                                child: Text(
                                                  "S'inscrire",
                                                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                    color: AppColor.kThirdColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Text(' | '),*/
                                            TextButton(
                                              onPressed: () => Get.toNamed(AppPages.login),
                                              child: Text(
                                                'Retour',
                                                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ]
                                      )
                                    ],
                                  ),
                                ]),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                Text('Contacter le support Ticket +', style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  )
                ),

              ]
          ),
        ),
      ),
    );

  }
}
