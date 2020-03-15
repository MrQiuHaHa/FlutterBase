import 'package:flutter/material.dart';
import 'package:flutter_app/demo/i18n/map/ninghao_demo_localizations.dart';


class I18NDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Locale locale = Localizations.localeOf(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('I18NDemo'),
        elevation: 0.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(locale.toString()),
            Text(
              Localizations.of(context, NinghaoDemoLocalizations).title,
              style: Theme.of(context).textTheme.title,
            )
          ],
        ),
      ),
    );
  }
}
