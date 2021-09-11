import 'package:flutter/material.dart';

import 'package:match_maker/common/colors.dart';

class InfoWidget extends StatelessWidget {
  final String name;
  final int age;
  final String place;

  const InfoWidget({
    this.name = '',
    this.age = 0,
    this.place = '',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black.withOpacity(0.5),
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(name,
                  style: TextStyle(color: AppColors.white, fontSize: 20.0)),
              Text(', ${age.toString()}',
                  style: TextStyle(color: AppColors.white, fontSize: 20.0)),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(place, style: TextStyle(color: AppColors.white, fontSize: 18.0)),
        ],
      ),
    );
  }
}
