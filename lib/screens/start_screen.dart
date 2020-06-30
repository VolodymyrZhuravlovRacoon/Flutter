import 'package:flutter/material.dart';
import 'package:flutter_circular_chart/flutter_circular_chart.dart';
import 'package:fluttertestapp/localization/app_translations.dart';
import 'package:fluttertestapp/utils/dimens.dart';

class StartScreen extends StatefulWidget {
  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int count_bonds = 0;
  final GlobalKey<AnimatedCircularChartState> _chartKey =
      new GlobalKey<AnimatedCircularChartState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var chart = Container(
        margin: EdgeInsets.all(0.0),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            onPressed: () => minusCount(context),
            icon: Icon(Icons.remove_circle,
                color: AppColor.of(context).btn_blue,
                size: AppDimens.of(context).main_margin_big),
            padding: EdgeInsets.all(0.0),
          ),
          Stack(alignment: Alignment.center, children: [
            Center(
                child: AnimatedCircularChart(
              key: _chartKey,
              size: const Size(200.0, 200.0),
              initialChartData: <CircularStackEntry>[
                CircularStackEntry(
                  <CircularSegmentEntry>[
                    CircularSegmentEntry(
                      count_bonds.toDouble(),
                      AppColor.of(context).circle_chart_yellow,
                      rankKey: 'completed',
                    ),
                    CircularSegmentEntry(
                      100.0 - count_bonds.toDouble(),
                      AppColor.of(context).circle_chart_grey,
                      rankKey: 'remaining',
                    ),
                  ],
                  rankKey: 'progress',
                ),
              ],
              chartType: CircularChartType.Radial,
              percentageValues: true,
            )),
            Center(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Text(count_bonds.toString(),
                      style: TextStyle(
                          fontSize: AppDimens.of(context).H02,
                          fontFamily: 'SF',
                          fontWeight: FontWeight.bold))
                ])),
          ]),
          IconButton(
              padding: EdgeInsets.all(0.0),
              onPressed: () => plusCount(context),
              icon: Icon(Icons.add_circle,
                  color: AppColor.of(context).btn_blue,
                  size: AppDimens.of(context).main_margin_big)),
        ]));
    return Scaffold(
      key: _scaffoldKey,
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  child: Text(
                      AppTranslations.of(context)
                          .text("left_menu_text")
                          .toUpperCase(),
                      style: TextStyle(
                          color: AppColor.of(context).btn_blue,
                          fontSize: AppDimens.of(context).H2,
                          fontFamily: 'SF',
                          fontWeight: FontWeight.bold))),
              ListTile(
                leading: Icon(Icons.remove_circle,
                    color: AppColor.of(context).btn_blue,
                    size: AppDimens.of(context).main_margin_big),
                onTap: () {
                  minusCount(context);
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
        endDrawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                  child: Text(
                      AppTranslations.of(context)
                          .text("right_menu_text")
                          .toUpperCase(),
                      style: TextStyle(
                          color: AppColor.of(context).btn_blue,
                          fontSize: AppDimens.of(context).H2,
                          fontFamily: 'SF',
                          fontWeight: FontWeight.bold))),
              Center(child: ListTile(
                leading: Icon(Icons.add_circle,
                    color: AppColor.of(context).btn_blue,
                    size: AppDimens.of(context).main_margin_big),
                onTap: () {
                  plusCount(context);
                  Navigator.pop(context);
                },
              ))
            ],
          ),
        ),
        appBar: AppBar(
          title: Center(
              child: Text(
                  AppTranslations.of(context).text("calc_text").toUpperCase(),
                  style: TextStyle(
                      color: AppColor.of(context).white_text,
                      fontSize: AppDimens.of(context).H2,
                      fontFamily: 'SF',
                      fontWeight: FontWeight.bold))),
          backgroundColor: AppColor.of(context).btn_blue,
        ),
        backgroundColor: AppColor.of(context).main_bg,
        body:  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                      Flexible(
                          child: SingleChildScrollView(
                              child: Center(child: chart)))
                    ])));
  }

  void minusCount(BuildContext context) {
    if (count_bonds != 0) {
      setState(() {
        count_bonds = count_bonds - 1;
      });
      updateChart(context);
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content:
              Text(AppTranslations.of(context).text('calc_error_nul_text')),
          backgroundColor: AppColor.of(context).red,
          duration: Duration(seconds: 3)));
    }
  }

  void plusCount(BuildContext context) {

    if (count_bonds < 100) {
      setState(() {
        count_bonds = count_bonds + 1;
      });
      updateChart(context);
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
          content:
              Text(AppTranslations.of(context).text('calc_error_more_text')),
          backgroundColor: AppColor.of(context).red,
          duration: Duration(seconds: 3)));
    }
  }
  void updateChart(BuildContext context){
    List<CircularStackEntry> nextData = <CircularStackEntry>[
      CircularStackEntry(
          <CircularSegmentEntry>[
            CircularSegmentEntry(count_bonds.toDouble(),  AppColor.of(context).circle_chart_yellow),
            CircularSegmentEntry(100.0 - count_bonds.toDouble(),
              AppColor.of(context).circle_chart_grey,)
          ]
      ),
    ];

    setState(() {
      _chartKey.currentState.updateData(nextData);
    });
  }
}
