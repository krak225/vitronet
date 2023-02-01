import 'package:flutter/material.dart';
import 'package:job_boarder/app/ui/theme/light_color.dart';

class SearchBoxWidget extends StatelessWidget {
  final dynamic onTapSettings;
  final dynamic onTapSearch;
  const SearchBoxWidget({Key? key, this.onTapSettings, this.onTapSearch}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: onTapSearch,
            child: Container(
              //width: 50,
                height: 50,
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: LightColor.lightGrey2),
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/search2.png',
                      width: 14,
                      height: 14,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Rechercher une offre ...',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                )
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: onTapSettings,
          child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: LightColor.secondAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                'assets/icons/setting.png',
                width: 16,
                height: 16,
              )
          ),
        )
      ],
    );
  }
}
