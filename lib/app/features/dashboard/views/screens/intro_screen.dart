import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:hello_depart/app/config/routes/app_pages.dart';

import '../../../../constans/app_color.dart';
import '../../controllers/intro_controller.dart';
class IntroScreen extends GetView<IntroController> {
  IntroScreen({Key? key}) : super(key: key);

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
                SizedBox(height: 10,),
                FadeInRight(
                  delay: Duration(milliseconds: 300),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 60,
                    child: Image.asset('assets/images/launcher_icon.png', height: 70,), //Text
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
                                              backgroundColor: AppColor.AccentColor, //Colors.orange,// fromHeight use double.infinity as width and 40 is the height
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
                Text('Pas encore inscrit,', style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  )
                ),
                const SizedBox(height: 30.0),
                FadeInRight(
                  delay: Duration(milliseconds: 300),
                  child:Center(
                    child: ElevatedButton.icon(
                      onPressed: () => controller.login(),
                      icon: Icon(Icons.arrow_forward),
                      label: Text("S'inscrire avec mon e-mail", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                      ),),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        backgroundColor: AppColor.white, //Colors.orange,// fromHeight use double.infinity as width and 40 is the height
                        foregroundColor: Colors.orange,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                FadeInRight(
                  delay: Duration(milliseconds: 300),
                  child:Center(
                    child: ElevatedButton.icon(
                      onPressed: () => controller.login(),
                      icon: Icon(Icons.account_circle),
                      label: Text("Se connecter avec Facebook", style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),),
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size.fromHeight(50),
                        backgroundColor: AppColor.white, //Colors.orange,// fromHeight use double.infinity as width and 40 is the height
                        foregroundColor: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ]
          ),
        ),
      ),
    );

  }
}
