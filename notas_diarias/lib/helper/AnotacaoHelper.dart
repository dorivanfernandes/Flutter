import 'package:notasdiarias/model/Anotacao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class AnotacaoHelper {
  static final String nomeTable = "anotacao";
  static final AnotacaoHelper _anotacaoHelper = AnotacaoHelper._internal();
  Database _banco;

  factory AnotacaoHelper() {
    return _anotacaoHelper;
  }

  AnotacaoHelper._internal() {}

  get banco async {
    if (_banco != null) {
      return _banco;
    } else {
      _banco = await inicializarDB();
      return _banco;
    }
  }

  _onCreate(Database db, int version) async {
    String sql =
        "CREATE TABLE anotacao (id integer primary key autoincrement, titulo varchar, descricao text, data datetime)";
    await db.execute(sql);
  }

  inicializarDB() async {
    final caminhoBanco = await getDatabasesPath();
    final localBanco = join(caminhoBanco, "bancoMinhasAnotacoes.db");

    var db = await openDatabase(localBanco, version: 1, onCreate: _onCreate);
    return db;
  }

  Future<int> AtualizarNota(Anotacao anotacao) async {
    var bancoDados = await banco;
    return await bancoDados.update(nomeTable, anotacao.toMap(),
        where: "id = ?", whereArgs: [anotacao.id]);
  }

  Future<int> salvarAnotacao(Anotacao anotacao) async {
    var bancoDados = await banco;

    int id = await bancoDados.insert(nomeTable, anotacao.toMap());
    return id;
  }

  Future<int> removerAnotacao(int id) async {
    var bancoDados = await banco;
    return bancoDados.delete(nomeTable, where: "id = ?", whereArgs: [id]);
  }

  recuperarAnotacoes() async {
    var bancoDados = await banco;
    String sql = "select * from $nomeTable order by data desc";
    List anotacoes = await bancoDados.rawQuery(sql);

    return anotacoes;
  }
}
