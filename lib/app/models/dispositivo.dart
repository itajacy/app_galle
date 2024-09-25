//* criado em Data: 20/08/2024
class Dispositivo {
  int? dispositivoId;
  String? address;
  String? urlImagens;
  String? representanteIdInt;
  String? email;

  Dispositivo({
    this.dispositivoId,
    this.address,
    this.urlImagens,
    this.representanteIdInt,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dispositivoId': dispositivoId,
      'address': address,
      'urlImagens': urlImagens,
      'representanteIdInt': representanteIdInt,
      'email': email,
    };
  }

  factory Dispositivo.fromMap(Map<String, dynamic> mapaDispositivo) {
    return Dispositivo(
      dispositivoId: mapaDispositivo['dispositivoId'] != null
          ? mapaDispositivo['dispositivoId'] as int
          : null,
      address: mapaDispositivo['address'] != null
          ? mapaDispositivo['address'] as String
          : null,
      urlImagens: mapaDispositivo['urlImagens'] != null
          ? mapaDispositivo['urlImagens'] as String
          : null,
      representanteIdInt: mapaDispositivo['representanteIdInt'] != null
          ? mapaDispositivo['representanteIdInt'] as String
          : null,
      email: mapaDispositivo['email'] != null
          ? mapaDispositivo['email'] as String
          : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Dispositivo.fromJson(String source) => Dispositivo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dispositivo(dispositivoId: $dispositivoId, address: $address, urlImagens: $urlImagens, representanteIdInt: $representanteIdInt, email: $email)';
  }
}
