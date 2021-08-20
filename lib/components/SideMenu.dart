import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/utility/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);
  static const routeName = 'side menu';

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  late AppConfigProvider provider;
  var colorTheme = Colors.white;
  var colorDarkTheme = Color.fromRGBO(20, 26, 46, 1);

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return  Drawer(
      child: Container(
        color: provider.isDarkTheme()? colorDarkTheme: colorTheme,
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

  Future<void> changeTheme() async{
    Navigator.pop(context);
    showModalBottomSheet(context: context, useRootNavigator: true,builder: (buildContext) {
      return Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  provider.changeToDarkTheme();
                },
                child: Container(
                    padding:EdgeInsets.symmetric(vertical:12),
                    child: Text("Dark",textAlign: TextAlign.center)
                ),
              ),
              InkWell(
                onTap: () {
                  provider.changeToLightTheme();
                },
                child: Container(
                    padding:EdgeInsets.symmetric(vertical:12),
                    child: Text("Light",textAlign: TextAlign.center)
                ),
              )
            ],
          ),
        ),
      );
    });
  }

}