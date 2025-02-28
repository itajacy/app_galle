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
