import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //nome da localização na UI
  String? time; //hora na localização selecionada
  String flag; // url do icone da flag
  String url; // api end point url
  bool? isDayTime; // true or false if daytime or not

  WorldTime(
      {required this.location,
      this.time,
      required this.flag,
      required this.url,
      this.isDayTime});

  Future<void> getTime() async {
    try {
      var urlApi = Uri.parse('https://worldtimeapi.org/api/timezone/$url');

      Response response = await get(urlApi);
      Map data = jsonDecode(response.body);

      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set time property
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      time = DateFormat.jm()
          .format(now); //function of intl que para formatar datetime
    } catch (e) {
      time =
          'Não foi possivel finalizar a sua solicitação!Por favor, tente novamente em alguns minutos.';
    }
  }
}
