//* criado em 22/08/2024

class Imagem {
  String? imagemId;
  DateTime? timeStamp;

  Imagem({
    this.imagemId,
    this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ImagemID': imagemId,
      'Timestamp': timeStamp,
    };
  }

  factory Imagem.fromMap(Map<String, dynamic> mapaImagem) {
    return Imagem(
      imagemId: mapaImagem['ImagemID'] != null
          ? mapaImagem['ImagemID'] as String
          : null,
      timeStamp: mapaImagem['Timestamp'] != null
          ? mapaImagem['Timestamp'] as DateTime
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Imagem.fromJson(String source) =>
  //     Imagem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Imagem(imagemId: $imagemId, timeStamp: $timeStamp)';
}

//====================

// void main() {
//   int timestamp1 = 20240223142748;
//   int timestamp2 = 20150513144840;
//   DateTime dateTime1 = convertTimestampToDateTime(timestamp1);
//   DateTime dateTime2 = convertTimestampToDateTime(timestamp2);

//   print('dateTime1: $dateTime1, type: ${dateTime1.runtimeType}');
//   print('dateTime2: $dateTime2, type: ${dateTime2.runtimeType}');

//   //! Para comparações  com DateTime  use os métodos .isAfter ou .isBefore
//   //! ou .isAtSameMomentAs
//   try {
//     print('dateTime1 > dateTime2: ${dateTime1.isAfter(dateTime2)}');
//   } catch (e) {
//     print('Erro na comparação: $e');
//   }
// }

// DateTime convertTimestampToDateTime(int timestamp) {
//   int year = timestamp ~/ 10000000000;
//   int month = (timestamp ~/ 100000000) % 100;
//   int day = (timestamp ~/ 1000000) % 100;
//   int hour = (timestamp ~/ 10000) % 100;
//   int minute = (timestamp ~/ 100) % 100;
//   int second = timestamp % 100;

//   return DateTime(year, month, day, hour, minute, second);
// }

// //! converte  para String e depois para DateTime
// DateTime convertTimestampToStringToDateTime(int timestamp) {
//   String timestampStr = timestamp.toString();

//   // Garante que a string tenha o comprimento correto
//   if (timestampStr.length != 14) {
//     throw FormatException("Timestamp inválido. Deve ter 14 dígitos.");
//   }

//   String year = timestampStr.substring(0, 4);
//   String month = timestampStr.substring(4, 6);
//   String day = timestampStr.substring(6, 8);
//   String hour = timestampStr.substring(8, 10);
//   String minute = timestampStr.substring(10, 12);
//   String second = timestampStr.substring(12, 14);

//   return DateTime.parse('$year-$month-${day}T$hour:$minute:$second');
// }

