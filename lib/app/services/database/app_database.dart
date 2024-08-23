import 'package:galle/app/services/database/dao/pedido_item_dao.dart';
import 'package:galle/app/services/database/dao/pedido_tabela_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'dao/clientes_dao.dart';
import 'dao/cor_dao.dart';
import 'dao/dispositivo_dao.dart';
import 'dao/grupo_dao.dart';
import 'dao/imagem_dao.dart';
import 'dao/linha_dao.dart';
import 'dao/material_dao.dart';
import 'dao/pedidos_dao.dart';
import 'dao/preco_dao.dart';
import 'dao/produto_dao.dart';
import 'dao/seq_dao.dart';
import 'dao/tabela_dao.dart';
import 'dao/tamanho_dao.dart';

Future<Database> getDatabase() async {
  final String path = await getDatabasesPath();

  return openDatabase(
    join(path, 'appGalle.db'),
    onCreate: (db, version) {
      //!  aqui estarão todas as tabelas que forem criadas
      db.execute(ClientesDao.tabelaClientes);
      db.execute(PedidosDao.tabelaPedidos);
      db.execute(DispositivoDao.tabelaDispositivo);
      db.execute(TabelaDao.tabelaTabela);
      db.execute(PedidoTabelaDao.tabelaPedidoTabela);
      db.execute(PedidoItemDao.tabelaPedidoItem);
      db.execute(CorDao.tabelaCor);
      db.execute(GrupoDao.tabelaGrupo);
      db.execute(ImagemDao.tabelaImagem);
      db.execute(LinhaDao.tabelaLinha);
      db.execute(MaterialDao.tabelaMaterial);
      db.execute(PrecoDao.tabelaPreco);
      db.execute(ProdutoDao.tabelaProduto);
      db.execute(SeqDao.tabelaSeq);
      db.execute(TamanhoDao.tabelaTamanho);
    },
    version: 1,
  );
}
