import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'AppConfigProvider.dart';

class SideMenu extends  StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  _SideMenuState createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu>{
  late AppConfigProvider provider;
  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    return Drawer(
        child:Container(
            padding:EdgeInsets.symmetric(vertical:48,horizontal:  24),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:[
                InkWell(
                  onTap: (){
                  },

                  child: Container(
                      padding:EdgeInsets.symmetric(vertical:12),
                      child: Text('Language')
                  ),
                ),
                InkWell(
                  onTap: (){
                    changeTheme();
                  },
                  child: Container(
                      padding:EdgeInsets.symmetric(vertical:12),
                      child: Text('Theme')
                  ),
                )
              ],
            )
        )
    );
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
                  child: Text('Dark',textAlign: TextAlign.center,)
              ),
            ),
            InkWell(
              onTap: (){
                provider.setTheme();
              },
              child: Container(
                  padding:EdgeInsets.symmetric(vertical:12),
                  child: provider.isDarkTheme()?
                  Text('Light',textAlign: TextAlign.center, style: TextStyle(color: Colors.red),):
                  Text('Light',textAlign: TextAlign.center, style: TextStyle(color: Colors.grey))
              ),
            )
          ],
        ),
      );
    });
  }
}


