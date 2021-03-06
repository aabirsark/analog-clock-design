import 'package:analog_app/components/body.dart';
import 'package:analog_app/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/Settings.svg',
          color: Theme.of(context).iconTheme.color,
        ),
        onPressed: () {},
      ),
      actions: [buildAddButton(context)],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: getProportionateScreenWidth(32),
          decoration: BoxDecoration(
              shape: BoxShape.circle, color: Theme.of(context).primaryColor),
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
