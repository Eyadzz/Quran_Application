import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quran_application/utility/api/ApiManager.dart';
import 'package:quran_application/utility/api/RadioResponse.dart';
import '../../utility/AppConfigProvider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:math' as math;
import 'package:radio_player/radio_player.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class RadioScreen extends StatefulWidget {

  static const routeName = "radio";

  @override
  _RadioScreenState createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen> {

  late AppConfigProvider provider;
  late Future<RadioResponse>radioStations;
  late String radioUrl;
  bool isPlaying = false;
  RadioPlayer radioPlayer = RadioPlayer();
  List<String>? metadata;
  var colorTheme = Color.fromRGBO(183, 147, 95, 1);
  var colorDarkTheme = Color.fromRGBO(252,196,64,1);
  late var currentTheme;
  static int index=0;
  String arabicRadio = "https://api.mp3quran.net/radios/radio_arabic.json";
  String englishRadio = "https://api.mp3quran.net/radios/radio_english.json";

  @override
  void initState(){
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<AppConfigProvider>(context);
    currentTheme = provider.isDarkTheme()? colorDarkTheme:colorTheme;
    radioStations = provider.isEnglish()?getRadioStations(englishRadio):getRadioStations(arabicRadio);
    final TextDirection currentDirection = Directionality.of(context);
    final bool isLTR = currentDirection == TextDirection.ltr;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: provider.isDarkTheme()? AssetImage("assets/images/bg.png"):AssetImage("assets/images/bg3.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Center(
        child: FutureBuilder<RadioResponse>(
          future: radioStations,
          builder: (context, stations){
            if(stations.hasData){
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Image.asset("assets/images/radio.png"),
                  SizedBox(height: 50),
                  Text(
                    AppLocalizations.of(context)!.radio,
                    style: Theme.of(context).textTheme.headline2,
                  ),
                  SizedBox(height: 60,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 50,),
                      Expanded(
                        child: Transform(
                            transform: Matrix4.rotationY(isLTR ? math.pi : 0),
                            alignment: AlignmentDirectional.center,
                            child: IconButton(
                                icon:  FaIcon(FontAwesomeIcons.stepForward, size: 25, color: currentTheme,),
                                onPressed: () {
                                  index == stations.data!.radios.length? index : index++;
                                  radioUrl = stations.data!.radios.elementAt(index).radio_url;
                                  radioPlayer.setMediaItem('', radioUrl);
                                  setState(() {});
                                }
                            )
                        ),
                      ),
                      Expanded(
                        child: IconButton(
                            icon: FaIcon(isPlaying?FontAwesomeIcons.pause:FontAwesomeIcons.play, size: 30, color: currentTheme,),
                            onPressed: () {
                              radioPlayer.setMediaItem('', stations.data!.radios.elementAt(index).radio_url);
                              isPlaying = !isPlaying;
                              isPlaying ? radioPlayer.play() : radioPlayer.pause();
                              setState(() {});
                            }
                        ),
                      ),
                      Expanded(
                        child: Transform(
                          transform: Matrix4.rotationY(isLTR ? math.pi : 0),
                          alignment: AlignmentDirectional.center,
                          child: IconButton(
                              icon: FaIcon(FontAwesomeIcons.stepBackward, size: 25, color: currentTheme,),
                              onPressed: () {
                                index==0? index: index--;
                                radioUrl = stations.data!.radios.elementAt(index).radio_url;
                                radioPlayer.setMediaItem('', radioUrl);
                                setState(() {});
                              }
                          ),
                        ),
                      ),
                      SizedBox(width: 50,),
                    ],
                  ),
                ],
              );
            }
            else if (stations.hasError) {
              return Text("Error loading radio");
          }
          return CircularProgressIndicator();
          },
        )
      ),
    );
  }
}
