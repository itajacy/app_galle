import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
/*
22/08/2024
*/

class Imagem {
  String? imagemId;
  int? timeStamp;

  Imagem({
    this.imagemId,
    this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'imagemId': imagemId,
      'timeStamp': timeStamp,
    };
  }

  factory Imagem.fromMap(Map<String, dynamic> mapaImagem) {
    return Imagem(
      imagemId: mapaImagem['imagemId'] != null
          ? mapaImagem['imagemId'] as String
          : null,
      timeStamp: mapaImagem['timeStamp'] != null
          ? mapaImagem['timeStamp'] as int
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Imagem.fromJson(String source) =>
  //     Imagem.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Imagem(imagemId: $imagemId, timeStamp: $timeStamp)';
}
