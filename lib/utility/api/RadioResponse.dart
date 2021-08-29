import 'package:quran_application/utility/api/Radios.dart';

class RadioResponse {

  List<Radio> radios;

	RadioResponse.fromJsonMap(Map<String, dynamic> map):
		radios = List<Radio>.from(map["radios"].map((it) => Radio.fromJsonMap(it)));

}
