// ignore_for_file: public_member_api_docs, sort_constructors_first
//* criado em Data: 20/08/2024
class Dispositivo {
  int? id;
  String? dispositivoId;
  String? address;
  String? urlImagens;
  String? representanteIdInt;
  String? usuarioFtp;
  String? senhaFtp;
  String? email;
  String? seqCliente;
  String? precoEsp;
  String? mercado;

  Dispositivo(
      {this.id,
      this.dispositivoId,
      this.address,
      this.urlImagens,
      this.representanteIdInt,
      this.usuarioFtp,
      this.senhaFtp,
      this.email,
      this.seqCliente,
      this.precoEsp,
      this.mercado});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'DispositivoID': dispositivoId,
      'address': address,
      'urlImagens': urlImagens,
      'RepresentanteID_Int': representanteIdInt,
      'usuarioFtp': usuarioFtp,
      'senhaFtp': senhaFtp,
      'email': email,
      'SeqCliente': seqCliente,
      'PrecoEsp': precoEsp,
      'Mercado': mercado,
    };
  }

  factory Dispositivo.fromMap(Map<String, dynamic> mapaDispositivo) {
    return Dispositivo(
      id: mapaDispositivo['id'] != null ? mapaDispositivo['id'] as int : null,
      dispositivoId: mapaDispositivo['DispositivoID'] != null
          ? mapaDispositivo['DispositivoID'] as String
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

      seqCliente: mapaDispositivo['SeqCliente'],
      precoEsp: mapaDispositivo['PrecoEsp'],
      mercado: mapaDispositivo['Mercado'],
      // seqCliente: mapaDispositivo['SeqCliente'] != null
      //     ? mapaDispositivo['SeqCliente'] as String
      //     : null,
      // precoEsp: mapaDispositivo['PrecoEsp'] != null
      //     ? mapaDispositivo['PrecoEsp'] as String
      //     : null,
      // mercado: mapaDispositivo['Mercado'] != null
      //     ? mapaDispositivo['Mercado'] as String
      //     : null,
    );
  }

  // String toJson() => json.encode(toMap());

  // factory Dispositivo.fromJson(String source) => Dispositivo.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dispositivo(id: $id, dispositivoId: $dispositivoId, address: $address, urlImagens: $urlImagens, representanteIdInt: $representanteIdInt, usuarioFtp: $usuarioFtp, senhaFtp: $senhaFtp, email: $email, seqCliente: $seqCliente, precoEsp: $precoEsp, mercado: $mercado)';
  }
}
