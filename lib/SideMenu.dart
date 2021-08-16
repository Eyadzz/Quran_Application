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
                    child: Text('Theme'),
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

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('English',textAlign: TextAlign.center,),
              ),
            ),

            InkWell(
              onTap: (){
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('العربية',textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      );
    });
  }

  void changeTheme() {
    Navigator.pop(context);
    showModalBottomSheet(context: context, builder: (buildContext){
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            InkWell(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Dark',textAlign: TextAlign.center,),
              ),
            ),

            InkWell(
              onTap: (){

              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text('Light',textAlign: TextAlign.center),
              ),
            ),
          ],
        ),
      );
    });
  }

}
