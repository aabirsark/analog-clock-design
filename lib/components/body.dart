import 'package:analog_app/components/show_time_in_hour_and_minute.dart';
import 'package:analog_app/size_config.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'clock.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Text(
            "Bilaspur , Chhattisgarh | IST",
            style: Theme.of(context).textTheme.bodyText1,
          ),
          ShowtimeInHourAndminute(),
          Spacer(),
          Clock(),
          Spacer(),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CountryCard(
                  country: "New York, USA",
                  timeZone: "+3 HRS | EST",
                  iconSrc: "assets/icons/Liberty.svg",
                  time: "9:20",
                  period: "PM",
                ),
                CountryCard(
                  country: "Sydney, AU",
                  timeZone: "+19 HRS | AEST",
                  iconSrc: "assets/icons/Sydney.svg",
                  time: "1:20",
                  period: "AM",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CountryCard extends StatelessWidget {
  const CountryCard({
    Key key,
    @required this.country,
    @required this.timeZone,
    @required this.iconSrc,
    @required this.time,
    @required this.period,
  }) : super(key: key);

  final String country, timeZone, iconSrc, time, period;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(20)),
      child: SizedBox(
        width: getProportionateScreenWidth(233),
        child: AspectRatio(
          aspectRatio: 1.32,
          child: Container(
            padding: EdgeInsets.all(getProportionateScreenWidth(20)),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: Theme.of(context).primaryIconTheme.color,
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  country,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: getProportionateScreenWidth(16)),
                ),
                SizedBox(height: 5),
                Text(timeZone),
                Spacer(),
                Row(
                  children: [
                    SvgPicture.asset(
                      iconSrc,
                      width: getProportionateScreenWidth(40),
                      color: Theme.of(context).accentIconTheme.color,
                    ),
                    Spacer(),
                    Text(
                      time,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    RotatedBox(
                      quarterTurns: 3,
                      child: Text(period),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
