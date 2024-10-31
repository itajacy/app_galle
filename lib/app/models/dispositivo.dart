// ignore_for_file: public_member_api_docs, sort_constructors_first
//* criado em Data: 20/08/2024
class Dispositivo {
  int? dispositivoId;
  String? address;
  String? urlImagens;
  String? representanteIdInt;
  String? usuarioFtp;
  String? senhaFtp;
  String? email;

  Dispositivo({
    this.dispositivoId,
    this.address,
    this.urlImagens,
    this.representanteIdInt,
    this.usuarioFtp,
    this.senhaFtp,
    this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'DispositivoID': dispositivoId,
      'address': address,
      'urlImagens': urlImagens,
      'RepresentanteID_Int': representanteIdInt,
      'usuarioFtp': usuarioFtp,
      'senhaFtp': senhaFtp,
      'email': email,
    };
  }

  factory Dispositivo.fromMap(Map<String, dynamic> mapaDispositivo) {
    return Dispositivo(
      dispositivoId: mapaDispositivo['DispositivoID'] != null
          ? mapaDispositivo['DispositivoID']
          : null,
      address: mapaDispositivo['address'] != null
          ? mapaDispositivo['address'] as String
          : null,
      urlImagens: mapaDispositivo['urlImagens'] != null
          ? mapaDispositivo['urlImagens'] as String
          : null,
      representanteIdInt: mapaDispositivo['RepresentanteID_Int'] != null
          ? mapaDispositivo['RepresentanteID_Int'] as String
          : null,
      usuarioFtp: mapaDispositivo['usuarioFtp'] != null
          ? mapaDispositivo['usuarioFtp'] as String
          : null,
      senhaFtp: mapaDispositivo['senhaFtp'] != null
          ? mapaDispositivo['senhaFtp'] as String
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
    return 'Dispositivo(dispositivoId: $dispositivoId, address: $address, urlImagens: $urlImagens, representanteIdInt: $representanteIdInt, usuarioFtp: $usuarioFtp, senhaFtp: $senhaFtp, email: $email)';
  }
}
