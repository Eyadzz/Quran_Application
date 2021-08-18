import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        color: provider.isDarkTheme()? Color.fromRGBO(20, 26, 46, 1): Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(15.0),
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
                //Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: Text(AppLocalizations.of(buildContext)!.english,textAlign: TextAlign.center,),
              ),
            ),

            InkWell(
              onTap: (){
                provider.changeLanguage('ar');
                //Navigator.of(context).pop();
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

  Future<void> changeTheme() async{
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    Navigator.pop(context);
    showModalBottomSheet(context: context, useRootNavigator: true,builder: (buildContext) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              InkWell(
                onTap: () async{
                  provider.setDarkTheme();
                  await _prefs.setBool("lightTheme", false);
                  //Navigator.of(context).pop();
                },

                child: Container(
                    padding:EdgeInsets.symmetric(vertical:12),
                    child: Text('Dark',textAlign: TextAlign.center)
                ),
              ),
              InkWell(
                onTap: () async{
                  provider.setTheme();
                  await _prefs.setBool("lightTheme", true);
                  //Navigator.of(context).pop();
                },
                child: Container(
                    padding:EdgeInsets.symmetric(vertical:12),
                    child: Text('Light',textAlign: TextAlign.center)
                ),
              )
            ],
          ),
        ),
      );
    });
  }

}