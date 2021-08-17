import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);
  static const routeName = 'side menu';

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return  Drawer(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 90,horizontal: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
                changeLanguage();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(AppLocalizations.of(context)!.language),
              ),
            ),

            InkWell(
              onTap: (){
                changeTheme();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(AppLocalizations.of(context)!.theme),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void changeLanguage() {
    Navigator.pop(context);
    showModalBottomSheet(context: context, builder: (buildContext){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){
                provider.changeLanguage('en');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(AppLocalizations.of(buildContext)!.english,textAlign: TextAlign.center,),
              ),
            ),

            InkWell(
              onTap: (){
                provider.changeLanguage('ar');
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(AppLocalizations.of(buildContext)!.arabic,textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      );
    });
  }

  void changeTheme() {
    showModalBottomSheet(context: context, useRootNavigator: true,builder: (buildContext) {
      return Container(
        child: Column(
          children: [
            InkWell(
              onTap: (){
                provider.setDarkTheme();
              },

              child: Container(
                  padding:EdgeInsets.symmetric(vertical:12),
                  child: provider.isDarkTheme()?
                  Text('Dark',textAlign: TextAlign.center, style: TextStyle(color: Colors.black),):
                  Text('Dark',textAlign: TextAlign.center, style: TextStyle(color: Colors.white))
              ),
            ),
            InkWell(
              onTap: (){
                provider.setTheme();
              },
              child: Container(
                  padding:EdgeInsets.symmetric(vertical:12),
                  child: provider.isDarkTheme()?
                  Text('Light',textAlign: TextAlign.center, style: TextStyle(color: Colors.white),):
                  Text('Light',textAlign: TextAlign.center, style: TextStyle(color: Colors.black))
              ),
            )
          ],
        ),
      );
    });
  }

}