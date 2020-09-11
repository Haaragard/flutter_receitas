import 'package:flutter/material.dart';
import '../../models/receipt.dart';

class Details extends StatelessWidget {

  final Receipt receipt;

  Details({Key key, @required this.receipt}): super(key: key);

  @override
  Widget build(BuildContext context) {
    return _construirDetails();
  }

  Widget _construirDetails() {
    return Scaffold(
      appBar: _construirAppBar(),
      body: ListView(
        children: <Widget>[
          _construirImagemDetalhes(receipt.foto),
          _construirTitleDetails(receipt.titulo),
          _construirLineDetails('${receipt.porcoes} porções', receipt.tempoPreparo),
          _construirSubtitleDetails('Ingredientes'),
          _construirTextDetails(receipt.ingredientes),
          _construirSubtitleDetails('Modo de Preparo'),
          _construirTextDetails(receipt.modoPreparo),
        ],
      ),
    );
  }

  Widget _construirImagemDetalhes(imagem) {
    return Image.asset(imagem);
  }

  Widget _construirTitleDetails(title) {
    return Center(child: Text(title, style: TextStyle(color: Colors.deepOrange, fontSize: 30,),),);
  }

  Widget _construirLineDetails(rendimento, tempo_preparo) {
    return Row(
      children: <Widget>[
        _construirColumnIconDetails(Icons.restaurant, rendimento),
        _construirColumnIconDetails(Icons.timer, tempo_preparo)
      ],
    );
  }

  Widget _construirColumnIconDetails(icon, text) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Icon(icon, color: Colors.deepOrange,),
          Text(text, style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),),

        ],
      ),
    );
  }

  Widget _construirSubtitleDetails(subtitle) {
    return Center(child: Text(subtitle, style: TextStyle(fontSize: 20,),),);
  }

  Widget _construirTextDetails(text) {
    return Container(padding: EdgeInsets.all(16), child: Text(text),);
  }

  Widget _construirAppBar() {
    return AppBar(title: Text('Cozinhando em Casa'));
  }
}