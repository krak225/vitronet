import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hello_depart/app/config/routes/app_pages.dart';

import '../../../../constans/app_color.dart';
import '../../controllers/login_controller.dart';
class LoginScreen extends GetView<LoginController> {
  LoginScreen({Key? key}) : super(key: key);

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
                /*Text('Connexion', style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                ),*/
                SizedBox(height: 10,),
                /*ElevatedButton(
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(16),
                    backgroundColor: Colors.white,
                    side: BorderSide(
                      width: 1.0,
                      color: Colors.white,
                    ),
                    shape: CircleBorder(),
                  ),
                  child: CircleAvatar(child: Image.asset(
                    'assets/images/logo.jpeg',
                  ),
                  )
                ),*/
                FadeInRight(
                    delay: Duration(milliseconds: 300),
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
                                          name: "email",
                                          initialValue: "",
                                          decoration: InputDecoration(labelText: "E-mail"),
                                          keyboardType: TextInputType.text,
                                          onSaved: (value) {
                                            //_username = value!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'E-mail requis';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                      FadeInRight(
                                        delay: Duration(milliseconds: 300),
                                        child:FormBuilderTextField(
                                          name: "password",
                                          initialValue: "",
                                          decoration: InputDecoration(labelText: "Mot de passe"),
                                          obscureText: true,
                                          onSaved: (value) {
                                            //_password = value!;
                                          },
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return 'Mot de passe requis';
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
                                            onPressed: () => controller.login(),
                                            icon: Icon(Icons.arrow_forward),
                                            label: Text('Se connecter', style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                                              onPressed: () => Get.toNamed(AppPages.details_evenement),
                                              child: Text(
                                                'Mot de passe oublié ?',
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
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )
                ),

              ]
          ),
        ),
      ),
    );

  }
}
