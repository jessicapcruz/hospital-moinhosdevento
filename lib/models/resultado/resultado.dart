import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import '../retorno/retorno.dart';
import 'nivelRisco.dart';

@JsonSerializable(explicitToJson: true)
class Resultado {
   Map<String, dynamic> retorno;
   Map<String, dynamic> nivelRisco;
   String dataEmergencia;

  Resultado({
    required this.retorno,
    required this.nivelRisco,
    required this.dataEmergencia
  });


  //JSON serialization
  factory Resultado.fromRawJson(String str) => Resultado.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

   /** factory Resultado.fromJson(Map<String, dynamic> json) {
     var retornoJson = json['retorno'];

     Map<String, dynamic> retornoMap = json['retorno'];
     Map<String, dynamic> nivelRiscoMap = json['nivelRisco'];

     retornoMap.forEach((k,v){
       print('  ${k} ${v}');
     });

     return Resultado(
         retorno: userMap,
         nivelRisco: json['nivelRisco'] as NivelRisco,
         dataEmergencia: json['dataEmergencia'] as String
     );
   }*/

  factory Resultado.fromJson(Map<String, dynamic> json) => Resultado(
       retorno: json['retorno'] as Map<String, dynamic>,
       nivelRisco: json['nivelRisco'] as Map<String, dynamic>,
       dataEmergencia: json['dataEmergencia'] as String
   );



  Map<String, dynamic> toJson() => {
    "retorno": retorno,
    "nivelRisco": nivelRisco,
    "dataEmergencia": dataEmergencia
  };

  Map toMap() {
    var map = new Map();

    map["retorno"] = retorno;
    map["nivelRisco"] = nivelRisco;
    map["dataEmergencia"] = dataEmergencia;
    return map;
  }
}