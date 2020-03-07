import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_date/logic/date_converter.dart';
import 'package:flutter_date/logic/home.dart';
import 'package:flutter_date/models/date_converter_model_args.dart';
import 'package:flutter_date/screens/date_converter.dart';
import 'package:flutter_date/util/screen.dart';
import 'package:provider/provider.dart';

class SelectConvert extends StatelessWidget {
  String text;
  bool isGregorianToHijri;
  ConvertDate convertDate;
  SelectConvert(
      {@required this.text,
      @required this.isGregorianToHijri,
      @required this.convertDate,
      void convertToGregorian});
  ConvertDate converterDate;
  YearValidator yearValidator;
  DayValidator dayValidator;

  @override
  Widget build(BuildContext context) {
    Screen screen = Provider.of<Screen>(context);
    DateConverterLogic dateConverterLogic =
        Provider.of<DateConverterLogic>(context);
    return SizedBox(
      height: screen.height / 10,
      width: screen.width / 1.5,
      child: FlatButton(
        color: Colors.amber,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.black, fontSize: 18),
          ),
        ),
        onPressed: () async {
          dateConverterLogic.convertType(context, convertDate);

          await Navigator.of(context).pushNamed(DateConverter.route,
              arguments: DateConverterModelArgs(this.isGregorianToHijri));
        },
      ),
    );
  }
}